#!/usr/bin/env python
# encoding: utf-8

import io
import pandas as pd

class MovingTotal:

    def __init__(self):
        self.mylist = []
        self.sum = []

    def append(self, numbers):
        """
        :param numbers: (list) The list of numbers.
        """
        self.mylist = self.mylist + numbers
        if len(self.mylist) >= 3:
            for ii in range(0, len(self.mylist)-2):
                print(ii)
                self.sum.append( sum(self.mylist[ii:ii+3]) )
        self.mylist = self.mylist[-3:]
        # if len(self.mylist) == 3:
            # self.sum.append( sum(self.mylist) )
        # print(self.mylist[-3:])
        # print(self.sum)
        pass

    def contains(self, total):
        """
        :param total: (int) The total to check for.
        :returns: (bool) If MovingTotal contains the total.
        """
        print(self.sum)
        if total in self.sum:
            return True
        return False

if __name__ == '__main__':
# if _name_ == "_main_":
    movingtotal = MovingTotal()
    movingtotal.append([1,2,3])
    print(movingtotal.contains(6))
    print(movingtotal.contains(9))
    movingtotal.append([4])
    print(movingtotal.contains(9))
    movingtotal.append([4])
    print(movingtotal.contains(9))

