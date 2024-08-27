#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

mkdir rom
fallocate -l 60G swap
chmod 600 swap
mkswap swap
swapon swap
echo 1 > /sys/module/zswap/parameters/enabled
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo
chmod a+x /bin/repo
apt update
apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
