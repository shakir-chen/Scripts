# Error
1. segmentation fault

int loc_min; // int loc_min=INT_MAX;
if (all_dist[ii] < loc_min) {
    loc_min = all_dist[ii];     //only read, not protect?
    loc_u = ii;
}

loc_min,loc_u ... // here, see loc_min and loc_u doesn't initialize, then segmentation fault


2. length is too long
loc_u = -1
loc_min = INT_MAX


2. path is not correct for large file
interesting: the shortest distance are all correct.

thanks for the god: the 2nd round, it shows 3582 instead of 833

finlly find the reason:
for input2, there are multiple shortest path. find global min each round will have race condtion where it depends on T1 and T2 coming sequence when T1 = T2 = glob_min.



4. glob_min brough segmentation fault in 10 threads situations
```
LOOP :
    mutex
        glob_min = xxxx
    mutex

    new_dist = glob_min + ...
```


