FROM httpd:2.4.51

ADD helloworld.apache.conf /usr/local/apache2/conf

RUN echo "Include /usr/local/apache2/conf/helloworld.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf
