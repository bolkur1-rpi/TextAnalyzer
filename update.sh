#! /usr/bin/bash

cd /home/repo/TextAnalyzer/
sudo git pull https://github.com/bolkur1-rpi/TextAnalyzer.git
sudo chmod 007 /home/repo/TextAnalyzer/html/temp
sudo chmod 007 /home/repo/TextAnalyzer/html/uploads
sudo chmod +x /home/repo/TextAnalyzer/html/bash/copyToUploads.sh
sudo chmod +x /home/repo/TextAnalyzer/build.sh
sudo rsync -a --delete /home/repo/TextAnalyzer/html/ /var/www/html/