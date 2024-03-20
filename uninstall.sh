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

Error handling
handle_error() {
    echo -e "${RED}An error occured.${NC}"
    exit 1
}

trap 'handle_error' ERR
uninstall_gitback() {
    sudo rm -f /usr/local/bin/gitback
    rm -rf ~/.gitback
}
# Main script
echo -e "${YELLOW}Deleting files...${NC}"
uninstall_gitback
echo -e "${GREEN}Finished!${NC}"