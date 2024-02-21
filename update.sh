#! /usr/bin/bash

cd /home/repo/TextAnalyzer/
sudo git pull https://github.com/bolkur1-rpi/TextAnalyzer.git
sudo rsync -a --delete /home/repo/TextAnalyzer/html/ /var/www/html/
sudo chmod 007 /var/www/html/temp/
sudo chmod 007 /var/www/html/uploads/
sudo chmod +x /var/www/html/bash/copyToUploads.sh