#!/bin/bash
directory=$(pwd)
commit_message=$(date +%m/%d/%Y)
cat="/bin/cat"
gitrepo=""
#Starts progress bars
revolver --style 'simpleDots' start 'Getting ready..'
#Cloning git repo
cd $TMPDIR
git clone $gitrepo gitback_backup > /dev/null
cd gitback_backup
# deleting old backup
rm -rf $directory > /dev/null
#copying files...
revolver update 'Copying...'
# copying files...
cp -r $directory .
# uploading files...
revolver update 'Uploading...'
#commiting files
git add ./
git commit -m $commit_message
#pushing files
git push origin main
#verifyinf commits
[ `git log --pretty=%H ...refs/heads/master^` = `git ls-remote origin
-h refs/heads/master |cut -f1` ] && : || (echo "Git repository not up to date!" && exit 1)
#cleaning up...
revolver update 'Cleaning up...'
cd ..
rm -rf gitback_backup
revolver stop
echo Finished!
