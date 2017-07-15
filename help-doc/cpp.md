cpp
---

# Packages
Bazel


# main
```
int main(int argc, char **argv){
    assert(utils::parse_args(argc, argv) == 0);
    assert(utils::read_file(utils::filename) == 0);
}

```


I/O utils
```
namespace utils {

    string filename; // input file name
    string outputfile; //output file name, default: 'output.txt'


    void print_usage() {
        cout << "Usage:\n" << "\topenmp_dijkstra -n <number of threads> -i <input file>" << endl;
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
```

# Error

1. stringstream ss(line) initializer but incomplete type?

```
#include <sstream>
#include <string>
```
<https://stackoverflow.com/questions/16545753/initializer-but-incomplete-type>
