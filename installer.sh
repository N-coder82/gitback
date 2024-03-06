#!/bin/bash
URL="https://example.com/example"
appname="app"
sudo curl $URL -o /usr/local/bin/$appname
sudo chmod +x /usr/local/bin/$appname