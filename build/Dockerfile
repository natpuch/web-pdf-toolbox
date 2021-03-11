FROM ubuntu:20.04

WORKDIR "/root"

RUN pwd

COPY install_apache.sh /root/install_apache.sh

RUN chmod +x install_apache.sh

RUN ./install_apache.sh

RUN DEBIAN_FRONTEND=noninteractive; apt-get install -y wget

COPY install_BoS.sh /root/install_BoS.sh

RUN chmod +x install_BoS.sh

RUN ./install_BoS.sh

RUN mkdir /tmp/pdf; chown -R www-data /tmp/pdf

WORKDIR "/var/www/html"

RUN DEBIAN_FRONTEND=noninteractive; apt-get install -y ghostscript

RUN ln -s /tmp/pdf pdf

RUN echo "service apache2 restart" >> /root/.bashrc

RUN ./build.sh

WORKDIR /root

COPY start.sh /root/start.sh

RUN chmod +x start.sh

CMD ["./start.sh"]
