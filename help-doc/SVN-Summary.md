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
    Undo:   Remember nearly-all can getback: 1. undo-commit 2. undo-stage 3. undo-edit, undo-stage
    Compare:
    Tag:

Branch : 1.create; 2.switch; 3.merge
Git Server
Distributed Git

Initial Unmodified State

        edit        undo-edit       stage       undo-stage      commit          undo commit         add
git     modify      git checkout -- git add/rm  git reset HEAD  git commit -m   git commit --amend  git add
svn     modify      svn revert . -R svn add/rm                  svn commit -m                       svn add

        diff-edit       diff-stage              diff-unmod
git     git diff --     git diff --cached --
svn                                             svn diff -c 9238

        branch-create   branch-switch   branch-commit       branch-merge
git     git checkout -b git checkout    git commit -a -m    git merge branchname
svn     svn copy        co or cd (bad)  svn commit          svn merge ^/calc/trunk

        log             
git     git log
svn     svn log -v XXX

Git-svn
<https://git-scm.com/docs/git-svn>


## Info
svn status
Diff: svn diff "/path/filename"

svn log -v -l 4 # svn log -v --limit 4
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

## Merge
1. trunk Merge to Branch
```
cd calc/branch
pwd                     #determine in branch
svn merge ^/calc/trunk
svn status              #modify, those file in modified stage
# build, test, ...
svn commit -m "Merged last trunk changes to my-calc-branch"
```

2. Branch Merge to trunk (Reintegrating)

```
cd calc/trunk
pwd
svn update
svn merge --reintegrate ^/calc/branches/my-calc-branch
# build test verify
svn commit -m "Merge my-calc-branch back into trunk"
```
3. Merge info
```
cd my-calc-branch
svn propget svn:mergeinfo .
svn mergeinfo ^/calc/trunk
svn propget svn:mergeinfo --recursive -v
```
4. Undoing Changes
```
svn merge -c -303 ^/calc/trunk          # reverse mergeing r303 to r302
svn status
svn diff
svn commit -m "undoing change comitted in r303"
```

The first step is to define exactly which item you're trying to resurrect. Here's a useful metaphor: you can think of every object in the repository as existing in a sort of two-dimensional coordinate system. The first coordinate is a particular revision tree, and the second coordinate is a path within that tree. So every version of your file or directory is defined by a specific coordinate pair. (Remember the “peg revision” syntax—foo.c@224—mentioned back in the section called “Peg and Operative Revisions”.)

```
cd parent-dir
svn log -v
svn copy ^/calc/trunk/real.c@807 ./real.c
svn status
svn commit -m "Resurrected real.c from revision 807, /calc/trunk/real.c."

svn cat ^/calc/trunk/real.c@807 > ./real.c
svn add real.c
svn commit -m "Re-created real.c from revision 807."
```

<http://svnbook.red-bean.com/en/1.7/svn.branchmerge.basicmerging.html>



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


## Git-SVN
Git with a SVN repo

<http://www.janosgyerik.com/practical-tips-for-using-git-with-large-subversion-repositories/>

## Some Useful SVN Tricks
1. Who Changed this line of code ? Who should I Contact?
$ svn annotate FILE
$ svn blame FILE
$ svn praise FILE

2. Watch Directroy
svn list svn+ssh://xuanqi@young.ece.ust.hk/home/svn_repository -R | egrep "/$"

<https://gcc.gnu.org/wiki/SvnTricks>
