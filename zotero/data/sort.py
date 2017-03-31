#!/usr/bin/env python
# encoding: utf-8

import pandas as pd
df = pd.read_json("small-data.json")
# type(df.author[1][1])

print(df.author[1][1]['given'],df.author[1][1]['family'])
