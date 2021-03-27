FROM ubuntu:20.04

WORKDIR "/root"

COPY install_scripts/install_apache.sh /root/install_apache.sh

RUN chmod +x install_apache.sh

RUN ./install_apache.sh

RUN DEBIAN_FRONTEND=noninteractive; apt-get install -y wget ghostscript imagemagick cron

RUN rm /etc/ImageMagick*/policy.xml

COPY install_scripts/install_BoS.sh /root/install_BoS.sh

RUN chmod +x install_BoS.sh

RUN ./install_BoS.sh

COPY install_scripts/hello_cron /etc/cron.d/hello_cron

RUN chmod 0644 /etc/cron.d/hello_cron

RUN crontab /etc/cron.d/hello_cron

RUN touch /var/log/cron.log

RUN DEBIAN_FRONTEND=noninteractive; apt-get clean; apt-get autoremove

RUN mkdir /tmp/pdf; chown -R www-data /tmp/pdf

RUN echo "service apache2 restart" >> /root/.bashrc

WORKDIR "/root"

COPY htsh_split /root/htsh_split

COPY generate_htsh.sh /root/generate_htsh.sh

RUN chmod +x generate_htsh.sh; ./generate_htsh.sh

COPY install_scripts/start.sh /root/start.sh

COPY html /var/www/html

RUN cp html/index.htsh /var/www/html/index.htsh

RUN rm -rf generate_htsh.sh htsh_split html install*

WORKDIR "/var/www/html"

WORKDIR "/root"

RUN chmod +x start.sh

CMD ["./start.sh"]
