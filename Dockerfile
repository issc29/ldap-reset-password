FROM php:5.6-apache

# Install needed php extensions: ldap
RUN \
   apt-get update && \
   apt-get install libldap2-dev libmcrypt-dev -y && \
   rm -rf /var/lib/apt/lists/* && \
   docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
   docker-php-ext-configure mcrypt --with-mcrypt=usr/lib/ && \
   docker-php-ext-install ldap mcrypt mbstring

RUN \
  cd /tmp && \
  curl -O http://tools.ltb-project.org/attachments/download/800/ltb-project-self-service-password-0.9.tar.gz && \
  tar zxvf ltb-project-self-service-password-0.9.tar.gz && \
  mv ltb-project-self-service-password-0.9/* /var/www/html/

ADD start.bash /ldap-start

# Define mountable directories.
VOLUME ["/ldap-override"]

# Define default command.
CMD ["bash", "/ldap-start"]

# Expose ports.
EXPOSE 80
