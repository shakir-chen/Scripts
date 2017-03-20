/* Name: CHEN Xuanqi
 * ID: 20299267
 * Email: xchenbr@connect.ust.hk
 */

/*
 * This is code skeleton for COMP5112-17Spring assignment2
 * Compile: g++ -std=c++11 -lpthread -o pthread_dijkstra pthread_dijkstra.cpp
 * Run: ./pthread_dijkstra -n <number of threads> -i <input file>,
 * you will find the output in 'output.txt' file
 */

#include <string>
#include <cassert>
#include <iostream>
#include <fstream>
#include <vector>
#include <climits>
#include <cstring>
#include <algorithm>
#include <sys/time.h>
#include <time.h>
#include <getopt.h>

#include <pthread.h>

using std::string;
using std::cout;
using std::endl;
using std::vector;


/*
 * utils is a namespace for utility functions
 * including I/O (read input file and print results) and one matrix dimension convert(2D->1D) function
 */
namespace utils {
    int num_threads; //number of thread
    int N; //number of vertices
    int *mat; // the adjacency matrix

    string filename; // input file name
    string outputfile; //output file name, default: 'output.txt'

    void print_usage() {
        cout << "Usage:\n" << "\tpthread_dijkstra -n <number of threads> -i <input file>" << endl;
        exit(0);
    }

    int parse_args(int argc, char **argv) {
        filename = "";
        outputfile = "output.txt";
        num_threads = 0;

        int opt;
        if (argc < 2) {
            print_usage();
        }
        while ((opt = getopt(argc, argv, "n:i:o:h")) != EOF) {
            switch (opt) {
                case 'n':
                    num_threads = atoi(optarg);
                    break;
                case 'i':
                    filename = optarg;
                    break;
                case 'o':
                    outputfile = optarg;
                    break;
                case 'h':
                case '?':
                default:
                    print_usage();
            }
        }
        if (filename.length() == 0 || num_threads == 0)
            print_usage();
        return 0;
    }

    /*
     * convert 2-dimension coordinate to 1-dimension
     */
    int convert_dimension_2D_1D(int x, int y) {
        return x * N + y;
    }

    int read_file(string filename) {
        std::ifstream inputf(filename, std::ifstream::in);
        inputf >> N;
        assert(N < (1024 * 1024 *
                    20)); // input matrix should be smaller than 20MB * 20MB (400MB, we don't have two much memory for multi-processors)
        mat = (int *) malloc(N * N * sizeof(int));
        for (int i = 0; i < N; i++)
            for (int j = 0; j < N; j++) {
                inputf >> mat[convert_dimension_2D_1D(i, j)];
            }

        return 0;
    }

    string format_path(int i, int *pred) {
        string out("");
        int current_vertex = i;
        while (current_vertex != 0) {
            string s = std::to_string(current_vertex);
            std::reverse(s.begin(), s.end());
            out = out + s + ">-";
            current_vertex = pred[current_vertex];
        }
        out = out + std::to_string(0);
        std::reverse(out.begin(), out.end());
        return out;
    }

    int print_result(int *dist, int *pred) {
        std::ofstream outputf(outputfile, std::ofstream::out);
        outputf << dist[0];
        for (int i = 1; i < N; i++) {
            outputf << " " << dist[i];
        }

#ifdef PRED
        outputf << "\n";
        for (int i = 1; i < N; i++) {
            outputf << " " << pred[i]<<"-"<<i;
        }
#endif

        for (int i = 0; i < N; i++) {
            outputf << "\n";
            if (dist[i] >= 1000000) {
                outputf << "NO PATH";
            } else {
                outputf << format_path(i, pred);
            }
        }
        outputf << endl;
        return 0;
    }
}//namespace utils

//Hint: use pthread condition variable or pthread barrier to do the synchronization
//------You may add helper functions and global variables here------
struct PthData{
    int len;            // virtuex length
    int head;           // virtuex head position
    // int* data_p;        // virtuex data pointer ?? need or not
};

PthData*  pthdata_p;
bool *visit;
int *all_dist;
int *all_pred;

int glob_u;       //glob_u location
int glob_min=INT_MAX;     //glob_min
int glob_min_temp=INT_MAX;     //glob_min_temp

int pth_count=0;

pthread_mutex_t mutex;
pthread_cond_t cond_var;

pthread_barrier_t barrier;

// void *Thread_dijkstra(void* rank, int* dist, int* pred){     // need args instead
void *Thread_dijkstra(void* rank){
    long my_rank =  (long) rank;
    // my_pred = pred;
    int ii;
    int *dist;
    int *pred;

    int loc_min=INT_MAX;
    int loc_u=-1;

    // printf("T%ld: %d,N-%d\n",my_rank,utils::num_threads,utils::N);

    // dist pred and vist initial

    for (ii=pthdata_p[my_rank].head; ii<pthdata_p[my_rank].head + pthdata_p[my_rank].len;ii++) {
        all_dist[ii] = utils::mat[utils::convert_dimension_2D_1D(0,ii)];
        all_pred[ii] = 0;
        visit[ii] = false;
#ifdef DEBUG
        // printf("--%d",all_dist[ii]);
#endif
    }

#ifdef DEBUG
    // printf("\n");
#endif
    visit[0] = true;

    for (int jj = 1; jj<utils::N; jj++ ){
        // find_global_minimum ======
        // loc min ---
        loc_min = INT_MAX;
        loc_u = -1;
        for (ii = pthdata_p[my_rank].head; ii < pthdata_p[my_rank].head + pthdata_p[my_rank].len; ii++) {
            // printf("D-%d",all_dist[ii]);
            if (!visit[ii]) {
                if (all_dist[ii] < loc_min) {
                    loc_min = all_dist[ii];     //only read, not protect?
                    loc_u = ii;
                }
            }
        }
        // glob min ---
        //hand it to main thread and wait
#ifdef DEBUG
        // printf("T%ld: loc_u-%d,loc_min-%d\n",my_rank,loc_u,loc_min);
        // printf("iter - %d\n",jj);
#endif

        /* // condtion barrier - glob_min init */
        // pthread_mutex_lock(&mutex);
        // pth_count++;
        // if (pth_count == utils::num_threads){
          // pth_count=0;
          // glob_min_temp = INT_MAX;
          // pthread_cond_broadcast(&cond_var);
        // } else {
          // while(pthread_cond_wait(&cond_var,&mutex) != 0);
        // }
        // pthread_mutex_unlock(&mutex);

/*         if (my_rank==0) */
          // glob_min_temp = INT_MAX;
        // pthread_barrier_wait(&barrier);

        //condtion barrier - get glob_min
        glob_min_temp = INT_MAX;
        pthread_barrier_wait(&barrier);

        if (loc_min < glob_min_temp){
            glob_min_temp = loc_min;
            glob_u = loc_u;
        }
        else if ((loc_min == glob_min_temp) && (loc_u < glob_u)){
            glob_u = loc_u;
        }
        pthread_barrier_wait(&barrier);

        glob_min=glob_min_temp;
        visit[glob_u] = true;
        pthread_barrier_wait(&barrier);

       /*  pthread_mutex_lock(&mutex); */
        // pth_count++;
        // if (pth_count == utils::num_threads){
            // pth_count = 0;
            // glob_min=glob_min_temp;
            // visit[glob_u] = true;
            // pthread_cond_broadcast(&cond_var);
        // } else {
            // while(pthread_cond_wait(&cond_var,&mutex) != 0);
        // }
        // pthread_mutex_unlock(&mutex);


        // refresh table======
        for (ii = pthdata_p[my_rank].head; ii < pthdata_p[my_rank].head+pthdata_p[my_rank].len; ii++) {
            if (!visit[ii]) {
                int new_dist = glob_min+ utils::mat[utils::convert_dimension_2D_1D(glob_u, ii)];
                if (new_dist < all_dist[ii]) {
                    all_dist[ii] = new_dist;
                    all_pred[ii] = glob_u;
                }
            }
        }
    }
    return NULL;
}

// void dijkstra(int N, int p, int *mat, int *all_dist, int *all_pred) {
void dijkstra(int N, int p, int *mat) {
    //------your code starts from here------
    long        thread;
    pthread_t*  thread_handles;

    int         rem;
    int         loc_n;

    visit = (bool*) malloc(N*sizeof(bool));

    thread_handles = (pthread_t*) malloc(p*sizeof(pthread_t));
    pthdata_p = (PthData*) malloc (p*sizeof(PthData));

    pthread_mutex_init(&mutex,NULL);
    pthread_cond_init(&cond_var,NULL);
    pthread_barrier_init(&barrier,NULL,p);

    loc_n = N/p;            //main process doesn't handle
    rem = N-loc_n*p;

    for (int ii=0; ii<p; ii++){
        if (ii<rem){
            pthdata_p[ii].len = loc_n +1;
            pthdata_p[ii].head = ii*(loc_n+1);
        } else {
            pthdata_p[ii].len = loc_n;
            pthdata_p[ii].head = rem + ii*loc_n;
        }
        // printf("pthdata[%d]: len - %d; head - %d\n",ii,pthdata_p[ii].len,pthdata_p[ii].head);
    }
    //checkpoint

    for (thread = 0; thread < p ; thread++)
        pthread_create(&thread_handles[thread], NULL,
            Thread_dijkstra, (void*)thread);

    // printf("Main Thread\n");

    for (thread = 0; thread < p ; thread++)
        pthread_join(thread_handles[thread], NULL);

    pthread_cond_destroy(&cond_var);
    pthread_barrier_destroy(&barrier);
    pthread_mutex_destroy(&mutex);
    free(visit);
    free(pthdata_p);
    free(thread_handles);
    //------end of your code------
}

int main(int argc, char **argv) {
    assert(utils::parse_args(argc, argv) == 0);
    assert(utils::read_file(utils::filename) == 0);

    assert(utils::num_threads <= utils::N);
    //`all_dist` stores the distances and `all_pred` stores the predecessors

    // int *all_dist;
    // int *all_pred;
    all_dist = (int *) calloc(utils::N, sizeof(int));
    all_pred = (int *) calloc(utils::N, sizeof(int));

    //time counter
    timeval start_wall_time_t, end_wall_time_t;
    float ms_wall;

    //start timer
    gettimeofday(&start_wall_time_t, nullptr);


    // dijkstra(utils::N, utils::num_threads, utils::mat, all_dist, all_pred);
    dijkstra(utils::N, utils::num_threads, utils::mat);

    //end timer
    gettimeofday(&end_wall_time_t, nullptr);
    ms_wall = ((end_wall_time_t.tv_sec - start_wall_time_t.tv_sec) * 1000 * 1000
               + end_wall_time_t.tv_usec - start_wall_time_t.tv_usec) / 1000.0;

    std::cerr << "Time(ms): " << ms_wall << endl;

    utils::print_result(all_dist, all_pred);

    free(utils::mat);
    free(all_dist);
    free(all_pred);
    return 0;
}
