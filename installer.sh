#!/bin/bash
# gitback: git based backup maker/manager
# Free, simple, and great for devs
# https://github.com/n-coder82/gitback
#
# Install with this command:
#
# curl -L https://raw.githubusercontent.com/N-coder82/gitback/main/installer.sh | bash
# Make sure you have `curl` installed


######## VARIABLES #########

URL="https://example.com/example"
appname="gitback"

######## FUNCTIONS #########

function updateprogress {
    if [ $2 = "end" ]; then
        echo -ne "[INFO] ${1}\033[0K\r"
    else
        echo -ne "[INFO] ${1}\033[0K\r"
    fi
}

updateprogress "Downloading app..."
sleep 3
updateprogress "Finished!"