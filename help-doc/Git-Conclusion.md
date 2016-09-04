#GitHub Users Guide
## Background
simply copy in time-stampe sequency: Easily to forget the directory
Local Version Control System: - RCS
Centralized Version Control System (CVCS): single point of central server failure, lose everything
Distributed Version Control System (DVCS): client don't just check out, but fully mirror the repository

Major Difference between : Git thinks about its data.
Git Basics <https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository>


##Create a new repository
```
echo "# Windows-Move-and-Switch" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/shakir-chen/Windows-Move-and-Switch.git
git push -u origin master
```

##Push an existing repo
```
git remote add origin https://github.com/shakir-chen/Windows-Move-and-Switch.git
git push -u origin master
```

##Git Status Check
```
git status
git status -s   # Short Status
```
See what you've changed but not yet staged
```
git diff
git diff --staged # compares your staged changes  equal to : git diff --cached
```
View the commit history

```
git log
git log -p -2       # -p shows the difference introduced in each commit; -2 limits optput to only the last two entries
git log -stat       # abbreviation
git log --pretty=oneline    #changes the log outputs to format,  full,short,fuller
```

##Search
```
git grep "foo()"
```

##Branch


```
git checkout -b iss53   #swtich to a new version shorthand for  git branch iss53  && git checkout iss53
vim XXX                 #Make some change
git commit -a -m 'info' #commit to iss53 branch

git checkout master     #switch back to master branch

git checkout -b hotfix  #swtich to a new version hotfix, and it is what you want
vim XXX                 #Make some change
git commit -a -m 'info' #commit to iss53 branch

git checkout master
git merge hotfix        #git simply move pointer Master to pointer hotfix, which calls fast-forward
```
Still Much to learn

<https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging>

##Undo
Can't always undo some of these undos!!
May lose some work Here.
```
git commit --amend          #want to commit as the formal commit with same infos
git reset HEAD <Files>      #unstage a staged files
git checkout -- <Files>     #unmodify a modified file, dangerous command
```
Anything that is committed in Git can almost always be recovered. Even in Branches, use --amend commit can be recovered.

##Working with Remote
```
git remote                              #showing your remote
git remote -v                           #showing your remote with fetch and push
git remote add <shortname> <url>        #adding remote repository
```
#### Update or fetch a Rep
```
git pull
git fetch [remotename]          #get date from remote projects
git push [remote-name] [branch-name]    #origin master
```
#### Inspect a remote
```
git remote show origin
git remote rename pb paul       #rename pb as paul
```

##Tag
```
git tag
git tag -l "v1.8.5*"
git tag -a v1.4 -m "my version 1.4"         #Annoted Tags
    git show v1.4
git tag v1.4-lw                             #light weight Tags
    git show v1.4-lw
git tag -a v1.2 9fceb02                     #9fceb02 is part of checksum, tag later
git push origin v1.5                        #transfer tags to remote servers
git checkout -b [branchname] [tagname]      #put a version with specific name by creating a new branch, carefully
```
##Reference
Good Summary<https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell>
<https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control>
