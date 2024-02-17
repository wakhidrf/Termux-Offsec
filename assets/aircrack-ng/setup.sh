#! /bin/bash

architecture=$(uname -r)

if [[ $architecture == *"aarch64"* ]]; then
	dpkg -i aircrack-ng_3_1.7_aarch64.deb
elif [[ $architecture == *"arm"* ]]; then
	dpkg -i aircrack-ng_3_1.7_arm.deb
elif [[ $architecture == *"i686"* ]]; then
	dpkg -i aircrack-ng_3_1.7_i686.deb
elif [[ $architecture == *"x86_64"* ]]; then
       dpkg -i aircrack-ng_3_1.7_x86_64.deb
else echo "architecture not supported. ignoring..."
fi
