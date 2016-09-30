# SVN Summary

It's easy to learn svn with git conception.
<https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository>


untracked - unmodified - modified - staged
                   ---edit-> ----stage->
                             <-u-stage--
                   <--u-edit-u-stage----
                   <--d-edit-
                   <-------diff-stage---
            <-d-unmod-
    <---remove---  <-------commit-------
                   -----undo-commit---->
    ----------------add---------------->

Git Basic
    Log:    Record Commit Information
    Undo:   1. undo-commit 2. undo-stage 3. undo-edit, undo-stage
    Compare:
    Tag:

Branch
Git Server
Distributed Git

Initial Unmodified State

        edit        undo-edit       stage       undo-stage      commit          undo commit         add
git     modify      git checkout -- git add/rm  git reset HEAD  git commit -m   git commit --amend  git add
svn     modify                      svn add/rm                  svn commit -m                       svn add
        diff-edit       diff-stage              diff-unod
git     git diff --     git diff --cached --
svn



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
svn co svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository/Software\ Release/JADE/branches/Jade-Zhehui-Xuanqi Jade-SVN
<http://svnbook.red-bean.com/en/1.7/svn.branchmerge.using.html>

1. Merge to trunk


## Checkout
```
svn co --depth immediate svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository svn
```

## Add and delete files - stage
svn add "path/item"
add all files unversioned

svn add --force * --auto-props --parents --depth infinity -q            #add
svn st | grep '^!' | awk '{print $2}' | xargs svn delete --force        #delete


## Commit to repo
svn commit -m "message" "/path"

