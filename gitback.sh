#!/bin/bash

# VARIABLES

# add backup git repo

backup_repo=""

# make tmp dir
mkdir $TMPDIR/gitback-temp

# add backup dir name to tmp dir
basename "$PWD" > $TMPDIR/gitback-temp/dirname
dirname=$(cat $TMPDIR/gitback-temp/dirname)

# add backup dir to tmp dir
pwd > $TMPDIR/gitback-temp/backupdir
backupdir=$(cat $TMPDIR/gitback-temp/backupdir)

# SCRIPT

# go to tmp dir
cd $TMPDIR/gitback-temp
# clone git repo
git clone --quiet $backup_repo backup_repo
# delete the dir thats going to be backed up (old ver) from git repo
rm -rf backup_repo/$dirname
# copy the fresh dir to be backed up into git repo
cp -r "${backupdir}" "backup_repo/"

# push changes to git repo
cd backup_repo
git add .
git commit -m "test commit"
git push origin main
cd ..
# delete the tmp dir
rm -rf $TMPDIR/gitback-temp/