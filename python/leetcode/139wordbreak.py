#!/usr/bin/env python
# encoding: utf-8

# learn how to use any and ,
# True, ==> tuple: (True, )
def wordBreak(s, words):
    ok = [True]
    for i in range(1, len(s) + 1):
        # print(type(any(ok[j] and s[j:i] in words for j in range(i))))
        # __import__('pdb').set_trace()
        ok += any(ok[j] and s[j:i] in words for j in range(i)),
    return ok[-1]


if __name__ == '__main__':
    s = "leetcode"
    words = ["leet", "code"]

    print(wordBreak(s, words))
