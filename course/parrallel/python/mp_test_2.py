#!/usr/bin/env python
# encoding: utf-8

import multiprocessing

def worker(item):
    print(item)
    return item

if __name__ == "__main__":
    with multiprocessing.Pool(4) as pool:
        for i in pool.imap_unordered(worker, range(100), chunksize=1):
            if i == 10:
                print('terminate')
                pool.terminate()
                break
    print('done')

