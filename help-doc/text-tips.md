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
5. grep specific group in regex match
    ```
    grep  -oP 'foo \K\w+' test.txt # output strings behind \K
    grep  -oP 'foo \K\w+(?=bar)' test.txt # output strings between \K and "bar"
    grep -oP '(?<=foo )\w+(?= bar)' test.txt' # output strings between "foo " and "bar"
    curl -s http://cs229.stanford.edu/notes/ | grep -oP '(?<=")\S+.pdf(?=")'
    ```
<http://unix.stackexchange.com/questions/13466/can-grep-output-only-specified-groupings-that-match>

## Rename
rename -n 's/(\w+)(\.sam)/$1\_x86$2/' *.sam     # -n means test

Double Quote vs Single Quote
Double Quotes use variable expansion, makes interpret; Single Quote donts;
```
my $var1 = 'Hello';

my $var2 = "$var1";
my $var3 = '$var1';

print $var2;
print "\n";
print $var3;
print "\n";

output:
Hello
$var2
```


<http://stackoverflow.com/questions/943795/whats-the-difference-between-single-and-double-quotes-in-perl>

perl regex warning: \1 better written as $1 at (eval 1) line 1
\1 means match the previous part, $1 means replac

