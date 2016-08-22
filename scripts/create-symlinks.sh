#!/bin/bash

# Create symlinks to app config files.
dir="/home/dev/Sources/Config/apps"
target="/etc/osp"
for f in "$dir"/*; do
  sudo ln -s "$f" "$target"
  echo "$f"
done

# Create symlinks to logback config files.
dir="/home/dev/Sources/Config/logging"
for f in "$dir"/*; do
  sudo ln -s "$f" "$target"
  echo "$f"
done

# Create symlinks to device simulator ECDSA keypair.
sudo ln -s /home/dev/Sources/Config/certificates/oslp/oslp_sim_ecdsa_private.der /etc/ssl/certs
sudo ln -s /home/dev/Sources/Config/certificates/oslp/oslp_sim_ecdsa_public.der /etc/ssl/certs

# Create symlinks to platform ECDSA keypair.
sudo ln -s /home/dev/Sources/Config/certificates/oslp/oslp_test_ecdsa_private.der /etc/ssl/certs
sudo ln -s /home/dev/Sources/Config/certificates/oslp/oslp_test_ecdsa_public.der /etc/ssl/certs


# Create symlink to CA certificate.
sudo ln -s /home/dev/Sources/Config/certificates/osgp-ca/certs/cacert.cer /etc/ssl/certs

# Create symlink to server certificate.
sudo ln -s /home/dev/Sources/Config/certificates/osgp-ca/certs/localhost.cert.pem /etc/ssl/certs

# Create symlink to organization certificate and personal information exchange.
sudo ln -s /home/dev/Sources/Config/certificates/osgp-ca/certs/test-org.cert.pem /etc/ssl/certs
sudo ln -s /home/dev/Sources/Config/certificates/osgp-ca/certs/test-org.pfx /etc/ssl/certs


# Create symlink to server private key.
sudo ln -s /home/dev/Sources/Config/certificates/osgp-ca/private/localhost.key.pem /etc/ssl/private

# Create symlink to organization private key.
sudo ln -s /home/dev/Sources/Config/certificates/osgp-ca/private/test-org.key.pem /etc/ssl/private


# Create symlink to keystore.
sudo ln -s /home/dev/Sources/Config/certificates/trust.jks /etc/ssl/certs


# Create symlink to apache vhost and remove the link to the 000-default.conf vhost.
sudo ln -s /home/dev/Sources/Config/apache-httpd/vhost.conf /etc/apache2/sites-enabled
sudo unlink /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# Create symlink to Maven settings
sudo mkdir /home/dev/.m2
sudo ln -s /home/dev/Sources/Config/maven/settings.xml /home/dev/.m2
sudo chown -R dev:dev /home/dev/.m2
