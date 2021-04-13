
all: install xcwd urxvt i3-install i3-config i3-layout
	echo "i3 installation success"

install:
	# install section
	sudo apt-get install pcmanfm rxvt-unicode htop feh xsel autojump scrot wmctrl libx11-dev xclip 

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


i3-install:
	sudo apt-get update
	sudo apt-get install i3

i3-config:
	# i3-config section
	mkdir -p ~/.config/i3
	rsync ./config ~/.config/i3/config
	sudo cp at_exit /usr/local/bin/

i3-status:
	# i3status section
	mkdir -p ~/.config/i3status
	rsync ./i3status.conf ~/.config/i3status/config
	

i3-layout:
	# i3-layout section
	mkdir -p ~/.config/i3
	rsync -r ./layouts/ ~/.config/i3/layouts/
	


.PHONY: xcwd
