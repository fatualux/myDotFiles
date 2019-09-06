#!/usr/bin/bash

cd ~  || return;
git init
echo "*" > .gitignore
git add -f .gitignore

git add -f .Xauthority
git add -f .Xdefaults
git add -f .Xmodmap
git add -f .Xresources
git add -f .asoundrc
git add -f .bashrc
git add -f .conkyrc
git add -f .fonts.conf
git add -f .gitconfig
git add -f .gtkrc
git add -f .gtkrc-2.0
git add -f .viminfo
git add -f .vimrc
git add -f .xinitrc

git add -f .config/compton/
git add -f .config/conky/
git add -f .config/dunst/
git add -f .config/gnome2/
git add -f .config/gtk-2.0/
git add -f .config/gtk-3.0/
git add -f .config/gtkrc
git add -f .config/gtkrc-2.0
git add -f .config/i3/
git add -f .config/i3-blocks/
git add -f .config/i3status/
git add -f .config/oomox/
git add -f .config/termite/
git add -f .config/touchegg/

git add -f .fonts/
git add -f .gconf/
git add -f .git/
git add -f .gkrellm2/
git add -f .icons/
git add -f .scripts/
git add -f .themes/
git add -f .vim/

git commit -m "First commit"
git remote add origin https://github.com/fatualux/myDotFiles
git push -u origin master
