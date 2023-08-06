#!/bin/bash

# Check if the parameter matches the given pattern (letters, numbers, _ and -)
if [[ $1 =~ ^[a-zA-Z0-9_-]+$ ]]; then
    # Set the git remote URLs
    git remote set-url --add --push origin git@git.sr.ht:~rafaelmc/$1
    git remote set-url --add --push origin git@github.com:rafamoreira/$1
else
    echo "Error: The provided parameter contains invalid characters. Please provide a string of letters, numbers, _ and -."
fi

