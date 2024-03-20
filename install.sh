#!/bin/bash
# TITLE: gitback
# DESC: git based backup utility/manager
# LATEST UPDATE: 3/19/2024
# AUTHOR: N-coder82

#!/bin/bash

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

handle_error() {
    echo -e "${RED}An error occured.${NC}"
    exit 1
}

trap 'handle_error' ERR
# Function to clone and build gitback
install_gitback() {
    git clone "https://github.com/N-coder82/gitback.git" &> /dev/null
    cd gitback
    make install &> /dev/null
}

# Function to get user input and save it to gitbackrepo file
save_input_to_file() {
    read -p "$(echo -e "${YELLOW}Enter your backup repository:${NC} ")" input
    echo "$input" > ~/.gitback/gitbackrepo
}

# Cleanup function
cleanup() {
    cd ..
    rm -rf gitback
}
# Main script
echo -e "${YELLOW}Getting and building executable...${NC}"
install_gitback

mkdir -p ~/.gitback
save_input_to_file

echo -e "${YELLOW}Cleaning up...${NC}"
cleanup

echo -e "${GREEN}Finished!${NC}"
echo -e "${RED}The executable can be found in /usr/local/bin, to uninstall delete .gitback and /usr/local/bin/gitback.${NC}"