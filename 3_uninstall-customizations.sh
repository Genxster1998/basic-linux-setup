#!/bin/bash
### restoration script for kde/plasma stock config
### note this script only reverts visual customizations.
### if you want to remove the kernel + linux tweaks + kernel configuration
### head over to thanas-x86-64-kernel source
### boot on stock kernel & run "2_uninstall-kernel.sh"
### this will not only remove kernel but all mentioned above
### if you want to re-enable customizations,
### run setup.sh till firefox pops up close and reboot after
### there is no need to re-run the full setup as long as no packages have been removed

###### SET DIR VARIABLES
source="$(pwd)"
stock=$source/.kubuntu

###### SET BASH COLORS
magenta="\033[05;1;95m"
yellow="\033[1;93m"
restore="\033[0m"

###### START
cd $stock
mkdir -p $stock/temp
sudo unzip -o kubuntu.zip -d $stock/temp
sudo rsync -v -K -a --force --include=".*" $stock/temp/.* ~/
cd ~/ && sudo chown -R $(id -u):$(id -g) $HOME
sudo rm -rf $stock/temp && cd $source
sudo rm -rf /boot/grub/splash.jpg
sudo update-grub2
echo -e "${yellow}"
echo Done. You can reboot...
echo -e "${restore}"
read -p "Press Enter to reboot or Ctrl+C to cancel"

sudo reboot

###### END
