# Conclusion
1. Variable
bash varibles are untyped
otherwise, use declare or typeset

2. Gramma

* space is used for seperation.   ""] could be regarded as one word.
* insdie "", not regard as string. because instruction will also be excuted
* difference between [[]] and [] : [[]] is bashs improvement to []
    In [[]],
    + Intuitive. $File not "$FILE"
    + Enable boolean operation
    +  =~ operator - enable regular experssion
    ```
    if [[ $ANSWER =~ ^y(es)?$ ]]
    ```

# Bug Fix
1. test.sh: 7: [: missing ]
```
if [ "$evin"=="" ] not if [ "$evin"==""]
```

2. test.sh: 7: [: 20319: unexpected operator
```
if [ "$evin"=="" ] not if [ $evin=="" ]
```

