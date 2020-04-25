#!/usr/bin/env python
# encoding: utf-8

from multiprocessing import Pool
import numpy as np


def compute(array):
    return array * array

if __name__ == '__main__':
    result = []
    # answer = []*10
    pool = Pool()
    for ii in range(0, 2):
        result.append(pool.apply_async(compute, [np.linspace(0, 1, 1E8)]))    # evaluate "solve1(A)" asynchronously

    answer1 = result[1].get(timeout=10)
    # for ii in range(0, 10):
        # answer[0] = result[0].get(timeout=10)
        # print( answer[0] )
    print( answer1 )

