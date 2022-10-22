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
echo "from source: ${sourcePath}"
echo "to target: ${targetPath}"
read_info="Do you wish to copy from source to target (y/n)"

read -p "${read_info}" answer
case ${answer} in
    y|Y )
        echo Yes;
    ;;
    * )
        echo Stopping...;
        exit;
    ;;
esac

echo "\nSyncing project folder without files under gitignore..."
# After the hours of research I have found exactly what I need: to sync the destination folder with the source folder (also deleting files in the destination if they were deleted in the source), and not to copy to the destination the files that are ignored by .gitignore, but also not to delete this files in the destination:
# exe rsync -vhra /source/project/ /destination/project/ --include='**.gitignore' --exclude='/.git' --filter=':- .gitignore' --delete-after
# rsync -vhra ${sourcePath} ${targetPath} --include='**.gitignore' --exclude='/.git' --filter=':- .gitignore' --delete-after
exe rsync -vhra ${sourcePath} ${targetPath} --include='**.gitignore' --exclude='/.git' --filter=':- .gitignore'

echo "\nComplete!"