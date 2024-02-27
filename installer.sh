#!/bin/bash
URL="https://example.com/example"
filename="example"
installdir="/usr/local/bin/"
appname="app"
appversion="1.0.0"
cd $installdir
sudo curl -o $appname $URL
sudo chmod +x $appname