#!/bin/bash

#* gitconfig simlink

REPOPATH=$(pwd)

echo 'Seting up Git'
ln -s $REPOPATH/gitconfig ~/.gitconfig 
ln -s $REPOPATH/gitconfig.personal ~/repos/personal/.gitconfig-personal