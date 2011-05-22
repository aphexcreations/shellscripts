#!/bin/bash

##
## Recursively Disable Filemode in Repositories
## There is probably a better way to do this, but
## whatever... This was quick and easy.
##
## Author: Brendon Crawford
##

readonly START_DIR="${1}"
find ${START_DIR} -type f -path "*/.git/config" -exec sed -i "s/filemode = true/filemode = false/" '{}' \;
