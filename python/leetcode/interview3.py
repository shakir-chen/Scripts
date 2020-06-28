#!/usr/bin/env python
# encoding: utf-8

# def nth_most_rare(elements, n):
    # """
    # :param elements: (list) List of integers.
    # :param n: (int) The n-th element function should return.
    # :returns: (int) The n-th most rare element in the elements list.
    # """
    # hs = {}
    # frq = {}
    # for i in range(0, len(elements)):
        # if elements[i] not in hs:
            # hs[elements[i]] = 1
        # else:
            # hs[elements[i]] += 1

    # for z, v in hs.iteritems():
        # if v not in frq:
            # frq[v] = [z]
        # else:
            # frq[v].append(z)
    # arr = []
    # for x in range(len(elements), 0):
        # if x in frq:
            # for i in frq[x]:
                # arr.append(i)

    # return [arr[x] for x in range(0, n)]
#     # return None

def nth_most_rare(nums, k):
    counts={}
    for n in nums:
        counts[n]=counts.get(n,0)+1
    uniques=sorted(counts, key=lambda x:counts[x], reverse=True)
    print(uniques)
    return uniques[-k]

if __name__ == '__main__':
    # print(nth_most_rare([5, 4, 3, 1, 5, 4, 3, 2, 5, 4, 3, 5, 4, 5], 2))
    print(nth_most_rare([5, 4, 3, 2, 1, 5, 4, 3, 2, 5, 4, 3, 5, 4, 5], 2))
    # print(nth_most_rare([5, 4, 3, 1, 5, 4, 3, 2, 5, 4, 3, 5, 4, 5], 2))
