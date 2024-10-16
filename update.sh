#! /usr/bin/bash
sudo git pull https://github.com/bolkur1-rpi/TextAnalyzer.git
sudo chmod 777 ./html/temp
sudo chmod 777 ./html/uploads
sudo chmod +x ./html/bash/copyToUploads.sh
sudo chmod +x ./build.sh
sudo chmod +x ./run.sh
sudo rsync -a --delete ./html/ /var/www/html/
