#!/usr/bin/env python
# encoding: utf-8

# import numpy as np
# import pandas as pd

# def pandas():
    # info = {'x' : 0., 'y' : 1., 'z' : 2.}
    # a = pd.Series(info)
    # print (a)

import io
import pandas as pd

def clean_csv(input_stream):
    """
    :param input_stream: (StringIO) An in-memory stream for text I/O containing CSV data
    :returns: (StringIO) An in-memory stream for text I/O containing CSV data
    """
    print(input_stream)
    lines = input_stream.readlines()
    for ll in lines:
        if ll[:4] == "Name":
            continue
        else:
            __import__('pdb').set_trace()
            if len(ll.split(",")) < 2:
                continue
            result_str = ll
    result_stream = io.StringIO(result_str)
    return result_stream


if __name__ == '__main__':
    input_stream = io.StringIO("Name,Surname\nJohn,Doe\nAnn,Franklin")
    result_stream = clean_csv(input_stream)
    print(result_stream.getvalue())
    input_stream.close()
    result_stream.close()
