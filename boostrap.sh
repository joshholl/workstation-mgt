#!/bin/sh
sudo apt-get update -qy
sudo apt-get install -qy git libxml2-dev libxslt-dev \
			aptitude python-dev python-setuptools \
			python-pip

install_dir=$HOME/setup

if [ ! -d "$install_dir" ]; then
	git clone https://github.com/joshholl/workstation-mgt.git $install_dir
	cd $install_dir
else
	cd $install_dir
	git pull
fi

./run_ansible.sh
