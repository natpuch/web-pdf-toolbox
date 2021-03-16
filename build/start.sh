#!/bin/bash

chown -R www-data /var/www/
chown -R www-data /tmp/pdf
cd /var/www/html/
ln -s /tmp/pdf pdf
chmod +x build.sh
./build.sh
service apache2 start
tail -F aa
