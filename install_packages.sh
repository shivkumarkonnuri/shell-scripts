#!/bin/bash
if [ $(id -u) -ne 0 ]
then echo "FAIL - Login as a root user to install these packages"
exit 1
else 
    apt-get update
fi
for package_name in $@
do
	if dpkg -s $package_name &>/dev/null 
	then echo "$package_name is already installed!"
	else apt install $package_name -y
	fi
done
