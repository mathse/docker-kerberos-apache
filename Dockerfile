FROM php:7-apache

# copy config files
COPY conf/krb5.conf /etc
COPY conf/HTTP.keytab /etc
COPY conf/000krb-apache.conf /etc/apache2/sites-enabled/
RUN chown www-data /etc/HTTP.keytab

# install missing packages
RUN apt-get update
RUN apt-get install -y libldap2-dev libapache2-mod-auth-kerb

# install php extensions
# RUN docker-php-ext-install mysqli
RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/
RUN docker-php-ext-install ldap

# open port
EXPOSE 80

# run apache
CMD /usr/sbin/apache2ctl -D FOREGROUND
