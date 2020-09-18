Test FLEX-5501

# Config
To set up a development environment take a look at the [Installation Manual](http://documentation.opensmartgridplatform.org/Userguide/Installation/Installationguide.html)

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

## Open smart grid platform information and news

High-level project information and news can be found on the open smart grid platform website: 
* [www.opensmartgridplatform.org](http://opensmartgridplatform.org)

Open smart grid platform detailed documentation:
* [documentation.opensmartgridplatform.org](http://documentation.opensmartgridplatform.org)

Open smart grid platform issue tracker:
* [Open smart grid platform Jira](https://smartsocietyservices.atlassian.net/projects/OC/issues)

Questions and discussions:
* [Open smart grid platform Discourse](https://opensmartgridplatform.discourse.group/)
