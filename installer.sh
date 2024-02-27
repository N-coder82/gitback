#!/bin/bash
URL="https://example.com"
filename="file"
installdir="/usr/local/bin"
appname="app"
appversion="1.0.0"
sudo cd $installdir
sudo mkdir $appname
sudo cd $appname
sudo mkdir $appversion
sudo cd $appversion
sudo curl -o $appname $URL
sudo chmod +x $appname