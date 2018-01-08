#find and remove
find -name .svn -exec rm -rf {} \;
```
find ~/ -type f -name "*.md"
```


#regex


.       any single character
*       zero or more
+       one or more times
<https://www.cyberciti.biz/faq/grep-regular-expressions/>


#Search

## Vim Search

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

## awk

## sed
sed : regex => easy to replace

    ```
    sed -rn 's/.*abc([0-9]+)xyz.*/\1/gp'            #-n don't print, -r escape the capture    /g global match, /p print result
    ```
sed only part of a line
    ```
    # sed -rne 's/"(.+,)"//\ldquo;\1/\ldquo;/gip' #not work
    sed -r 's/"(.+,)"/\\ldquo;\1\\rdquo;/' bib.html         # replace " to \ldquo; and " to \rdquo;
    ```

non-ascii : sed -i 's/[\d128-\d255]//g' FILENAME

<http://sed.sourceforge.net/sed1line.txt>

not character:
[^x]
<https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions.html>

the first match
    ```
    sed '0,/RE/s//to_that/' file
    ```

lazy matching
<https://linuxconfig.org/how-to-substitute-only-a-first-match-occurrence-using-sed-command>

Error
1. unterminated 's'
sed 's/xx/yy' ======>  sed 's/xx/yy/'

2. sed: -e expression #1, char 30: invalid reference \1 on `s' command's RHS`
sed -ir 's/"(.+,)"/\\ldquo;\1\\rdquo;/g' bib.html

3. only sed the first o, instead all?
echo "/home/shakir/Dropbox/Paper/Luo et al_2016_POSTER.pdf" | sed -r 's/o//'

sed -r 's/o//g'         # remember to use global, otherwise, only process the first one



## grep
1. search part of string
    ```
    file idle | grep -oP "\w+:\s\K\w+"      # -P perl-style regxes, -o only, \K output the last part
    $ grep -oP '(?<=foo )\w+(?= bar)' test.txt      # match words between foo and bar, \w+, not \w\+
    ```
2. Logic
or : grep 'pattern1\|pattern2' filename
     grep -E 'pattern1|pattern2' filename
     egrep 'pattern1|pattern2' filename
     grep -e pattern1 -e pattern2 filename

and :
     grep -E 'pattern1.*pattern2' filename
     grep -E 'pattern1' filename | grep -E 'pattern2'

not :
    grep -v 'pattern1' filename

3. Recursively Find Files and Replace
    grep -rl matchstring somedir/ | xargs sed -i 's/string1/string2/g'

4. match the first one (lazy matching)
    '''
    echo "<em> Photonics Technology Letters, dfsadf, "| grep -oP '<em>(.+?)[A-Za-z_]+,\s'
    '''

sed -n '/PATTERN/p' FILE.txt
sed -n '/PATTERN/!p' FILE.txt           # exclude a pattern ; p means print
sed -n 'N,/PATTERN/p' FILE.txt          # from line N, search pattern and print
<http://www.yourownlinux.com/2015/04/sed-command-in-linux-print-lines-in-file.html>


## python
1. split with multiple delimiters
    ```
    >>> a='Beautiful, is; better*than\nugly'
    >>> import re
    >>> re.split('; |, |\*|\n',a)
    ['Beautiful', 'is', 'better', 'than', 'ugly']
    ```
    ```
    string.split(":")
    ```

2. search pattern and groups
    print(re.search(r"\d\d\d\d",lines[ii]).group(0))
    ```
    >>> m = re.match(r"(\w+) (\w+)", "Isaac Newton, physicist")
    >>> m.group(0)       # The entire match
    'Isaac Newton'
    >>> m.group(1)       # The first parenthesized subgroup.
    'Isaac'
    >>> m.group(2)       # The second parenthesized subgroup.
    'Newton'
    >>> m.group(1, 2)    # Multiple arguments give us a tuple.
    ('Isaac', 'Newton')
    ```

3. sed-like => re.sub
    line_temp=re.sub('<li>|</li>','',lines[ii])

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

6. grep, but only certain file extensions
```
grep -r -i --include \*.h --include \*.cpp CP_Image ~/path[12345] | mailx -s GREP email@domain.com
grep -r -i --include \*.md
```

```
find . -type f -name "*.md"
```


## Rename
```
rename -n 's/(\w+)(\.sam)/$1\_x86$2/' *.sam     # -n means test
```

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


## charater
1. italic
    <em>xxxx<em>
2. quote
    &ldquo;     &rdquo;         # Better
    "
3. an amersand:&amp (html & means start a character reference)


## bash
<http://tldp.org/LDP/abs/html/string-manipulation.html>
replacement
echo ${stringZ/abc/xyz}
${string:position:length}


