#!/bin/bash

# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew : https://github.com/mxcl/homebrew/wiki/installation
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

#Get basic stuff
brew install git hub cloc gnu-tar htop tmux wget zsh-completions the_silver_searcher

#Get the latest Python 2 Version
brew install python
brew linkapps python
pip install --upgrade pip

#Setup Oh My ZSH
if [ ! -d ~/.oh-my-zsh ] ; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  pip install powerline-status
  mkdir ~/Fonts && cd ~/Fonts
  git clone git@github.com:powerline/fonts.git powerline
  cd powerline && ./install.sh
else
  echo "Oh My ZSH Already installed..."
fi

#Setup symlinks for user customization
scriptDir=~/projects/codecounselor/scripts
if [ ! -d $scriptDir ] ; then
  echo "Cloning code counselor scripts"
  mkdir -p ~/projects/codecounselor
  cd ~/projects/codecounselor/
  git clone git@github.com:codecounselor/scripts.git
else
  cd $scriptDir; git pull
fi

cd ~
links=( ".bash_gitrc" ".zshrc" ".vim" ".vimrc" ".naterc" "slate/.slate")
for link in "${links[@]}"
do
  echo "Linking $link"
  ln -F -s $scriptDir/$link .
done

CASKS=(
  menumeters
  iterm2
  slate
  google-chrome
  atom
  webstorm
  slack
  java
  mysqlworkbench
)
brew cask install ${CASKS[@]}
