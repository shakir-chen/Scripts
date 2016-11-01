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
```

