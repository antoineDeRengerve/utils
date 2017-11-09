
all: install xcwd urxvt i3-autobuild i3-config i3-layout
	echo "i3 installation success"

install:
	# install section
	sudo apt-get install pcmanfm rxvt-unicode htop feh xsel autojump scrot

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
	# font-size perl extension
	cp ext/urxvt-font-size/font-size ~/.urxvt/ext/
	# url-picker perl extension
	cp ext/urxvt-url-picker/url-picker ~/.urxvt/ext/
	# change default terminator
	sudo update-alternatives --config x-terminal-emulator


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
	mkdir -p ~/.config/i3
	rsync ./config ~/.config/i3/config

i3-layout:
	# i3-layout section
	mkdir -p ~/.config/i3
	rsync -r ./layouts/ ~/.config/i3/layouts/
	


.PHONY: xcwd
