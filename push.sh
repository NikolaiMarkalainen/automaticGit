#!/bin/sh

pushingToGit(){
sleep 1
echo "Adding files to remote directory"
git add -A
sleep 1
echo "What is the commit message along the push"
read commitMessage
git commit -m "$commitMessage"
sleep 1
echo ""
echo "Pushing to master"
echo ""
git push -u origin master
}

checkForRemoteOrigin(){
 echo " "
 echo "Checking for remote directory..."
 sleep 1.5
 $?
 if [ $(git remote show origin)==128 ]; then
  echo ""
  echo "Add remote origin"
  git remote remove origin
  read remoteOrigin
  sleep 1
  git remote add origin $remoteOrigin
 else
  echo "Remote origin exsists"
  git remote -v
  echo "To remove current remote directory use (git remote remove origin)" 
 fi
}


echo "Creating git push for current repo"
if [ -d .git ]; then
 echo "File has already been initialized"
 sleep 1 
 checkForRemoteOrigin
 pushingToGit
else
 git init
 sleep 1
 checkForRemoteOrigin
 pushingToGit
fi
