#!/usr/bin/env python
# encoding: utf-8

from typing import List

class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        while nums is not None:
            nn = nums.pop()
            # print(nn)
            try:
                nn_index = nums.index(nn)
            except:
                return nn
            nums.pop(nn_index)

        return nn

# class Solution:
    # def singleNumber(self, nums: List[int]) -> int:
        # while nums is not None:
            # nn = nums.pop()
            # print(nn)
            # nn_index = nums.index(nn)
            # if nn_index is not None:
                # nums.pop(nn_index)
            # else:
                # return nn

if __name__ == '__main__':
    mysol = Solution()
    nn = mysol.singleNumber([3,4,4])
    print(nn)
