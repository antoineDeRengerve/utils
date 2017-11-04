
all: install xcwd urxvt i3-autobuild i3-config
	echo "i3 installation success"

install:
	# install section
	sudo apt-get install pcmanfm xterm rxvt-unicode zsh htop feh

xcwd:
	# xcwd section
	cd xcwd && make && sudo make install && cd - > /dev/null

urxvt:
	# URXVT section
	cp /etc/inputrc ~/.inputrc
	cp Xresources ~/.Xresources
	xrdb ~/.Xresources
	mkdir -p ~/.urxvt/ext
	# keyboard-select perl extension
	cp ext/urxvt-perls/keyboard-select ~/.urxvt/ext/


i3-autobuild:
	# i3-autobuild section
	/usr/lib/apt/apt-helper download-file http://dl.bintray.com/i3/i3-autobuild-ubuntu/pool/main/i/i3-autobuild-keyring/i3-autobuild-keyring_2016.10.01_all.deb keyring.deb SHA256:460e8c7f67a6ae7c3996cc8a5915548fe2fee9637b1653353ec62b954978d844
	sudo apt-get install ./keyring.deb
	sudo rm ./keyring.deb
	echo 'deb http://dl.bintray.com/i3/i3-autobuild-ubuntu xenial main' > ./i3-autobuild.list
	sudo mv ./i3-autobuild.list /etc/apt/sources.list.d/i3-autobuild.list
	sudo apt-get update
	sudo apt-get install i3

i3-config:
	# i3-config section
	rsync ./config ~/.config/i3/config

