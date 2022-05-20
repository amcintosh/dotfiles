#!/usr/bin/env bash

# Setup for github codespaces

cp .bashrc.codespaces ~/.bashrc
cp .bash_aliases ~/.bash_aliases
cp .vimrc ~/.vimrc
cp -r .vim ~/.vim

source ~/.bashrc;
