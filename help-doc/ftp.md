ftp
---

# git-ftp
## 1. Install
```
git clone https://github.com/git-ftp/git-ftp.git
tag="$(git tag | grep '^[0-9]*\.[0-9]*\.[0-9]*$' | tail -1)"
git check "$tag"        # current 1.3.3
sudo make install
```
<https://github.com/git-ftp/git-ftp/blob/master/INSTALL.md>

## 2. Usage
```
# Setup
git config git-ftp.url ftp.example.net
git config git-ftp.user ftp-user
git config git-ftp.password secr3t

# Upload all files
git ftp init

# Or if the files are already there
git ftp catchup

# Work and deploy
echo "new content" >> index.txt
git commit index.txt -m "Add new content"
git ftp push
# 1 file to sync:
# [1 of 1] Buffered for upload 'index.txt'.
# Uploading ...
# Last deployment changed to ded01b27e5c785fb251150805308d3d0f8117387.
```
<https://github.com/git-ftp/git-ftp>

