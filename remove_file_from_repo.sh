#test
#set path to working dir
workingdir=$HOME/dotfiles.git
filetoremove='megarc'
repo=https://github.com/hansdg1/dotfiles.git
git clone --mirror $repo 
cd $workingdir

wget 'https://repository.sonatype.org/service/local/repositories/central-proxy/content/com/madgag/bfg/1.11.8/bfg-1.11.8.jar'

#https://rtyley.github.io/bfg-repo-cleaner/
java -jar bfg-1.11.8.jar --delete-files $filetoremove .
git reflog expire --expire=now --all
git gc --prune=now --aggressive

git push

