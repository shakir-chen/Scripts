#find and remove
find -name .svn -exec rm -rf {} \;


#Search
Vim Search

```
#delete last word of line
:%s/\s\+\w\+$//         #\s whitespace; \+ one or more; \w word ; $ end of line

#delete the 2nd word of line
:%s/^\w\+\s\+\zs\w\+\s\+//      #\zs...\ze replace area

Help Document in Vim: :help pattern         :ubtitute
```

Vim Search and Copy
```
:g/pattern/y A          #copy
:g/pattern/d            #delete matched pattern
:v/pattern/d            #delete all lines that dno not match the given pattern
```

http://vimregex.com/


```
\(\<\w\+\>\)\_s*\<\1\>
pattern pattern pattern

\(        \)                Capture the match so it can be reused later
  \<    \>      \<  \>      Match (with zero-width) beginning/end of word
    \w\+                    Match one or more word characters
            \_s*            Match zero or more whitespace characters, including newlines
                  \1        Match the same text as the first capture
```
```
%s/^\zs\.\ze\/\(\w\+\)_/\.\/\1/gc

./h264ref/h264ref_base.gcc43-64bit -d foreman_ref_encoder_baseline.cfg
./h264ref_base.gcc43-64bit -d foreman_ref_encoder_baseline.cfg

some text here
blah blah 123                   some text here
another new line          =>    blah blah 123
some other text as well         some other text as well
another line

sed '/text\|blah/!d' file
```

sed : regex => easy to replace

```
sed -rn 's/.*abc([0-9]+)xyz.*/\1/gp'            #-n don't print, -r escape the capture    /g global match, /p print result
```
awk sed grep

```
file idle | grep -oP "\w+:\s\K\w+"      # -P perl-style regxes, -o only, \K output the last part
$ grep -oP '(?<=foo )\w+(?= bar)' test.txt      # match words between foo and bar, \w+, not \w\+
```

##Basic Operation
1. Change Pattern   (sed)
    \zs \ze

2. Copy Pattern (awk, copy pattern and reconstruct)
    ```
    \(..\) ==> \1
    ```
3. Remove Pattern   (sed)

4. Only Remain Pattern      (grep, bettern in search)
    ```
    grep -o "^\w\+:" file
    sed -e  # greedy match
    ```

