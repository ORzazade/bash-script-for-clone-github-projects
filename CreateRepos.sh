#!/bin/sh

###########################
## Shell script to clone a list of github repositories and run `mvn clean install` on each one of them
##
## Usage: put a file called `repos.txt` in the folder of the script containing the repository URLs, line by line:
##
##https://github.com/pulse00/Composer-Eclipse-Plugin.git
##git@github.com:pulse00/Symfony-2-Eclipse-Plugin.git
##etc
###########################

cwd=`pwd`

while read line
do
  projects+=( "$line" )
done < $cwd/repos.txt;

for project in "${projects[@]}"
do
   :
   cd '../'
#    echo $project; 
# exit;
    # try git@github.com:username/repo-name.git first
  name=$(echo $project | awk -F/ '{print $2}')
	if ! test -n "$name"; then
	
	    name=$(echo $project | awk -F/ '{print $4}')
		
	fi

# 	# try https://github.com/username/repo-name.git
	if ! test -n "$name"; then
	    echo "Unable to parse directory for $project"
	    continue
	fi

	name=${name%.git}	
	# at=`pwd`
	# echo $at
	# fullpath="$at/$name"
	# prjpath="$at/$project"
	# if the directory does not exist, clone the repos and run maven
	if [ ! -d "name" ]; then
		git clone $project
		# cd $name
		# at=`pwd`
		# npm install
		# echo $fullpath
		cd $cwd
	fi
done