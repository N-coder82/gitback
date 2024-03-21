#!/bin/bash

# Variables:

backup_repo=$(cat ~/.gitback/backuprepo)

# Functions:

temp_dir_setup() {
mkdir $TMPDIR/gitback-temp
basename "$PWD" > $TMPDIR/gitback-temp/dirname
dirname=$(cat $TMPDIR/gitback-temp/dirname)
pwd > $TMPDIR/gitback-temp/backupdir
backupdir=$(cat $TMPDIR/gitback-temp/backupdir)
}
user_info() {
echo "Backing up... (This may take a while)"
}
update_repo() {
cd $TMPDIR/gitback-temp
git clone --quiet $backup_repo backup_repo
rm -rf backup_repo/$dirname
cp -r "${backupdir}" "backup_repo/"
}
push_changes() {
cd backup_repo
git add . &> /dev/null
commit_message=$(date)
git commit -m "gitback backup at: ${commit_message}" &> /dev/null
git push origin main &> /dev/null
}
cleanup() {
cd ..
rm -rf $TMPDIR/gitback-temp
}

# Main Script

# Setup the temporray directory
temp_dir_setup
# Show info about the backup to the user
user_info
# Update the repository with the new folder
update_repo
# Push the changes
push_changes
# Cleanup our giant mess.
cleanup