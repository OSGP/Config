# Config
To set up a development environment take a look at the [Installation Manual](http://documentation.gfx.lfenergy.org/Userguide/Installation/Installationguide.html)

## What does this repo contain?
This repo contains the following files:

- apps/*.properties files with key-value-pairs for Java apps
- logging/*-logback.xml files for <a href="http://logback.qos.ch">logback</a>
- context.xml file for <a href="http://tomcat.apache.org">Apache Tomcat</a>
- vhost for <a href="http://httpd.apache.org">Apache HTTP Server</a>
- localhost.cert.pem, localhost.key.pem and cacert.cer for <a href="http://httpd.apache.org">Apache HTTP Server</a>
- trust.jks, org.cert.pem, org.pfx used for webservice security
- sql script to create users and databases
- *.der files for secure communication with smart devices
- settings.xml file for <a href="https://maven.apache.org">Apache Maven</a>
- puppet scripts and manifests
- vagrant file to role out your development environment in virtualbox

## Grid eXchange Fabric information and news

High-level project information and news can be found on the Grid eXchange Fabric website:
* [www.lfenergy.org/projects/gxf/](https://www.lfenergy.org/projects/gxf/)

Grid eXchange Fabric detailed documentation:
* [documentation.gxf.lfenergy.org](https://documentation.gxf.lfenergy.org)

Grid eXchange Fabric issue tracker (will be decommissioned soon...):
* [Grid eXchange Fabric Jira](https://smartsocietyservices.atlassian.net/projects/OC/issues)

Questions and discussions:
* [Grid eXchange Fabric Discourse](https://opensmartgridplatform.discourse.group/)
