PDB
---


# Tutorial
similar to gdb

```
$ vim epdb1.py

import pdb           # pdb debugger
a = "aaa"
pdb.set_trace()      # tracing begining
b = "bbb"
c = "ccc"
final = a + b + c
print final
```

## View
l(ist)
p(rint)         # p c => "ccc"
w(here)         # show 

<https://docs.python.org/3/library/pdb.html>

## Operation
n(ext)
s(tep)
c(ontinue)
q(uit)

<https://pythonconquerstheuniverse.wordpress.com/2009/09/10/debugging-in-python/>

# .pdbrc

# Reference
<https://docs.python.org/2/library/pdb.html>
<https://docs.python.org/3/library/pdb.html>
