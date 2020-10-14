#!/bin/bash

# shellcheck disable=SC1091
source /etc/lsb-release

RUNNING_KERNEL=$(uname -r)

case $DISTRIB_ID in
    Arch)
        INSTALLED=$(pacman -Q linux | sed 's/linux //' | sed 's/.arch/-arch/');;
    *)
        echo Unknown distro
        exit 1;;
esac

if [[ ${INSTALLED} != "${RUNNING_KERNEL}" ]]; then
    echo "Reboot required"
    exit 0
else
    echo ""
fi
