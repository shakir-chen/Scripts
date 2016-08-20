echo $1 "is replaced by" $2

grep -rl "$1" . | xargs sed -i s/$1/$2/g

grep -r $2 .
