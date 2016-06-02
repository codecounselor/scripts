#If a directory has several git repositories, this script will perform a git command (i.e. git pull) on each of them
gitCommand="git pull"

#TODO: Read from arguments

for REPO in `ls -al | grep ^d | grep -v '\.\/' | awk 'NF>1{print $NF}'`; 
  do (cd "$REPO"; ${gitCommand}); 
done;

