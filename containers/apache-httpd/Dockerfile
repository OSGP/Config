FROM httpd:2.4-alpine

# Copy web-site files to the htdocs folder.
#COPY ./public-html/ /usr/local/apache2/htdocs/

# Copy all certificates etc.
COPY cacert.cer /usr/local/apache2/conf/
COPY trust.jks /usr/local/apache2/conf/
COPY localhost.key.pem /usr/local/apache2/conf/
COPY localhost.cert.pem /usr/local/apache2/conf/
COPY localhost.pfx /usr/local/apache2/conf/
COPY enexis-poc.osgp.cloud.key.pem /usr/local/apache2/conf/
COPY enexis-poc.osgp.cloud.cert.pem /usr/local/apache2/conf/
COPY enexis-poc.osgp.cloud.pfx /usr/local/apache2/conf/
COPY LianderNetManagement.pfx /usr/local/apache2/conf/
COPY test-org.pfx /usr/local/apache2/conf/

# Enable desired modules.
RUN sed -i 's@#LoadModule ssl_module modules/mod_ssl.so@LoadModule ssl_module modules/mod_ssl.so@' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's@#LoadModule socache_shmcb_module modules/mod_socache_shmcb.so@LoadModule socache_shmcb_module modules/mod_socache_shmcb.so@' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's@#LoadModule proxy_module modules/mod_proxy.so@LoadModule proxy_module modules/mod_proxy.so@' /usr/local/apache2/conf/httpd.conf
RUN sed -i 's@#LoadModule proxy_ajp_module modules/mod_proxy_ajp.so@LoadModule proxy_ajp_module modules/mod_proxy_ajp.so@' /usr/local/apache2/conf/httpd.conf

# Copy vhost to configuration folder.
COPY vhost.conf /usr/local/apache2/conf/vhost.conf

# Include vhost in httpd.conf
RUN sed -i -e "\$aInclude /usr/local/apache2/conf/vhost.conf" /usr/local/apache2/conf/httpd.conf
