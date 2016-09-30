# SVN Summary

## Info
svn status
Diff: svn diff "/path/filename"

## Update
svn update --set-depth immediates / infinity / empty

## Branch
```
$ svn copy http://svn.example.com/repos/calc/trunk \
           http://svn.example.com/repos/calc/branches/my-calc-branch \
        -m "Creating a private branch of /calc/trunk."
Committed revision 341.

$ svn checkout http://svn.example.com/repos/calc/branches/my-calc-branch
A  my-calc-branch/Makefile
A  my-calc-branch/integer.c
A  my-calc-branch/button.c
Checked out revision 341.
```
svn checkout svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository/Software\ Release/JADE/branches/Jade-Zhehui-Xuanqi Jade-SVN
<http://svnbook.red-bean.com/en/1.7/svn.branchmerge.using.html>

## Checkout
```
svn co --depth immediate svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository svn
```

## Add files
svn add "path/item"

add all files unversioned
svn add --force * --auto-props --parents --depth infinity -q            #add
svn st | grep '^!' | awk '{print $2}' | xargs svn delete --force        #delete

## Commit to repo
svn commit -m "message" "/path"

## svn get branch
svn
