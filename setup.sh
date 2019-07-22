#!/usr/bin/env sh

os=$(uname -s)
export PATH=/usr/local/bin:$PATH

if [ "$os" == "Darwin" ]; then
	# copied from https://stackoverflow.com/a/35005051 
	check=$((xcode-\select --install) 2>&1)
	echo $check
	str="xcode-select: note: install requested for command line developer tools"
	while [[ "$check" == "$str" ]];
	do
  		osascript -e 'tell app "System Events" to display dialog "xcode command-line tools missing." buttons "OK" default button 1 with title "xcode command-line tools"'
	done

	echo "Checking for pip"	
	command -v pip
	if [ "$?" -ne "0" ]; then 
		echo "Installing pip......"
		sudo easy_install pip
	fi
else 
	sudo apt-get update -qy
	sudo apt-get install -qy git libxml2-dev libxslt-dev \
			aptitude python-dev python-setuptools \
		python-pip
fi
install_dir=$HOME/setup

if [ ! -d "$install_dir" ]; then
	git clone https://github.com/joshholl/workstation-mgt.git $install_dir
	cd $install_dir
else
	cd $install_dir
	git pull
fi

sudo -H CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
ansible-playbook site.yml -i HOSTS "$@"
exit 0

