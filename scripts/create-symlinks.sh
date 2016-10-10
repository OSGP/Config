#!/bin/bash

# Create symlinks to app config files.
dir="/home/dev/Sources/OSGP/Config/apps"
target="/etc/osp"
for f in "$dir"/*; do
  sudo ln -sf "$f" "$target"
  echo "$f"
done

# Create symlinks to logback config files.
dir="/home/dev/Sources/OSGP/Config/logging"
for f in "$dir"/*; do
  sudo ln -sf "$f" "$target"
  echo "$f"
done

# Create symlinks to device simulator ECDSA keypair.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_sim_ecdsa_private.der /etc/ssl/certs
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_sim_ecdsa_public.der /etc/ssl/certs

# Create symlinks to platform ECDSA keypair.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_test_ecdsa_private.der /etc/ssl/certs
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/oslp_test_ecdsa_public.der /etc/ssl/certs

# Create symlinks to secret.aes.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/oslp/secret.aes /etc/ssl/certs

# Create symlink to CA certificate.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/cacert.cer /etc/ssl/certs

# Create symlink to server certificate.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/localhost.cert.pem /etc/ssl/certs

# Create symlink to organization certificate and personal information exchange.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/test-org.cert.pem /etc/ssl/certs
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/certs/test-org.pfx /etc/ssl/certs


# Create symlink to server private key.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/private/localhost.key.pem /etc/ssl/private

# Create symlink to organization private key.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/osgp-ca/private/test-org.key.pem /etc/ssl/private


# Create symlink to keystore.
sudo ln -sf /home/dev/Sources/OSGP/Config/certificates/trust.jks /etc/ssl/certs


# Create symlink to apache vhost and remove the link to the 000-default.conf vhost.
sudo ln -sf /home/dev/Sources/OSGP/Config/apache-httpd/vhost.conf /etc/apache2/sites-enabled
sudo service apache2 restart

# Create symlink to Maven settings
sudo mkdir -p /home/dev/.m2
sudo ln -sf /home/dev/Sources/OSGP/Config/maven/settings.xml /home/dev/.m2
sudo chown -R dev:dev /home/dev/.m2
