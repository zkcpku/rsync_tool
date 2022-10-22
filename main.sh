#!/bin/bash

# function to display commands
exe() { echo "\$ $@" ; "$@"; }

# load variables from .env file
export $(cat $1 | xargs)

# local configuration
sourcePath=${SRC_PATH}

# project configuration
projectName=${NAME}

# target configuration
targetPath=${TGT_PATH}

# ask if you want to deploy
read -p "Do you wish to copy from ${SRC_PATH} to ${TGT_PATH} (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo Yes;
    ;;
    * )
        echo Stopping...;
        exit;
    ;;
esac


# # process deploy
# echo "\nStepping into root folder..."
# exe cd ${sourcePath}

# echo "\nGetting list of files under the git ignore..."
# gitExcludesString=`git -C ${sourcePath} ls-files --exclude-standard -oi`
# IFS=$'\n' ignore=($gitExcludesString)

# echo "\nAppending git files..."
# ignore+=('.git' '.gitignore' '.gitkeep')

# echo "\nBuilding temporary file for the list of excluded files..."
# pathToExcludeFIle="${sourcePath}/.deploy.log"
# excludesString=$(printf "%s\\\n" "${ignore[@]}")
# echo $excludesString > ${pathToExcludeFIle}

echo "\nSyncing project folder without files under gitignore..."
# After the hours of research I have found exactly what I need: to sync the destination folder with the source folder (also deleting files in the destination if they were deleted in the source), and not to copy to the destination the files that are ignored by .gitignore, but also not to delete this files in the destination:
# exe rsync -vhra /source/project/ /destination/project/ --include='**.gitignore' --exclude='/.git' --filter=':- .gitignore' --delete-after
exe rsync -vhra ${sourcePath} ${targetPath} --include='**.gitignore' --exclude='/.git' --filter=':- .gitignore' --delete-after
# exe rsync -a --exclude-from=$pathToExcludeFIle ${sourcePath}/ ${targetUser}@${targetHost}:${targetPath}

echo "\nComplete!"