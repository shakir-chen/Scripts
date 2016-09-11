# SVN Summary

## Info
svn status
Diff: svn diff "/path/filename"

## Update
svn update --set-depth immediates / infinity / empty

## Branch

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
