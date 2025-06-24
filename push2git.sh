#!/bin/bash

# WARNING:
# Executing personal scripts can expose your system to security risks and unintended consequences.
# Ensure you thoroughly understand the script’s functionality, trust its source, and have backups of important data before proceeding.
# Always review the code and consider the potential impact on your system and data privacy.
# Proceed with caution and at your own risk.
#
# This is a personal project of ADITYA KUMAR | GitHub: https://github.com/roxxamay
#

# Intro
tput setaf 5

cat <<"EOF"

░▄▀▀▄░█░▒█░█▀▀░█░░░░█▀█░█▀▀▀░░▀░░▀█▀░░░░█▀▀░█░░░
░█▄▄█░█░▒█░▀▀▄░█▀▀█░▒▄▀░█░▀▄░░█▀░░█░░▄▄░▀▀▄░█▀▀█
░█░░░░░▀▀▀░▀▀▀░▀░░▀░█▄▄░▀▀▀▀░▀▀▀░░▀░░▀▀░▀▀▀░▀░░▀

EOF

# Backup command
cat <<"EOF"

░█▀▀▄░█▀▄░█▀▄░░▀░░█▀▀▄░█▀▀▀░░░█▀▀▄░█░░█░
░█▄▄█░█░█░█░█░░█▀░█░▒█░█░▀▄░░░█▄▄█░█░░█░
░▀░░▀░▀▀░░▀▀░░▀▀▀░▀░░▀░▀▀▀▀░░░▀░░▀░▀▀░▀▀

EOF

git add --all .

# Commit
cat <<"EOF"

░█░░░█░█▀▀▄░░▀░░▀█▀░█▀▀░░░█░░█░▄▀▀▄░█░▒█░█▀▀▄░░░█▀▄░▄▀▀▄░█▀▄▀█░█▀▄▀█░░▀░░▀█▀
░▀▄█▄▀░█▄▄▀░░█▀░░█░░█▀▀░░░█▄▄█░█░░█░█░▒█░█▄▄▀░░░█░░░█░░█░█░▀░█░█░▀░█░░█▀░░█░
░░▀░▀░░▀░▀▀░▀▀▀░░▀░░▀▀▀░░░▄▄▄▀░░▀▀░░░▀▀▀░▀░▀▀░░░▀▀▀░░▀▀░░▀░░▒▀░▀░░▒▀░▀▀▀░░▀░

EOF

# Get commit message from argument, fallback to prompt if not provided
if [ -n "$1" ]; then
    input="$*"
else
    echo -n "Enter commit message: "
    read input
fi

git commit -m "$input"

# Push logic
if grep -q "\[branch \"main\"\]" .git/config; then
    echo "Using main"
    git push -u origin main
elif grep -q "\[branch \"master\"\]" .git/config; then
    echo "Using master"
    git push -u origin master
else
    echo "No main or master branch found in .git/config."
fi

# Outro
cat <<"EOF"

░█▀▀▀░░▀░░▀█▀░░░▄▀▀▄░█░▒█░█▀▀░█░░░░░░█▀▄░▄▀▀▄░█▀▀▄░█▀▀
░█░▀▄░░█▀░░█░░░░█▄▄█░█░▒█░▀▀▄░█▀▀█░░░█░█░█░░█░█░▒█░█▀▀
░▀▀▀▀░▀▀▀░░▀░░░░█░░░░░▀▀▀░▀▀▀░▀░░▀░░░▀▀░░░▀▀░░▀░░▀░▀▀▀

EOF

