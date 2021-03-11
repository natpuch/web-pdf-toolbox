#!/bin/bash

chown -R www-data /var/www/html/
chown -R www-data /tmp/pdf
cd /var/www/html/
./build.sh
service apache2 start
tail -F eee
