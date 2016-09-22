#!/bin/bash

#TODO: Jade Project Management
# echo "backup Jade-Project"
#rename with different name and Check the name in Jade Backup first, if there is no name conflict.
mv --backup=t *.tar.gz Jade-Backup

echo "backup doc"
tar -czvf doc.tar.gz doc
echo "mv doc to Movable Disk"
mv doc.tar.gz Jade-Backup

echo "backup Exps"
tar -czvf Exps.tar.gz Exps
mv Exps.tar.gz Jade-Backup

