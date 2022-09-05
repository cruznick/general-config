#!/bin/bash

#* gitconfig simlink

REPOPATH=$(pwd)

echo 'Seting up Git'
ln -sfv $REPOPATH/gitconfig ~/.gitconfig 
ln -sfv $REPOPATH/gitconfig.personal ~/repos/personal/.gitconfig-personal
ln -sfv $REPOPATH/zshrc ~/.zshrc

