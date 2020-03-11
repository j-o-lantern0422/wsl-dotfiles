#!/bin/bash

apt update
apt install -y wget
wget https://github.com/itamae-kitchen/mitamae/releases/download/v1.11.5/mitamae-x86_64-linux.tar.gz
tar xvf mitamae-x86_64-linux.tar.gz
mv mitamae-x86_64-linux /usr/local/bin/mitamae
