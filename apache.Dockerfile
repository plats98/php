FROM httpd:2.4.51


# INSTALL 
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    wget \
    unzip
  

WORKDIR /usr/local/apache2/conf

RUN wget -P /usr/local/apache2/conf https://raw.githubusercontent.com/plats98/php/main/helloworld.apache.conf


RUN echo "Include /usr/local/apache2/conf/helloworld.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf
