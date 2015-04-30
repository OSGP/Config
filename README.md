# Config
Configuration for OSGP components and development environment.

## Setup development environment
To set up a development environment using puppet scripts, follow these steps:

- get an [Ubuntu 14.04.2 LTS live cd](http://www.ubuntu.com/download/desktop)
- install a virtual machine or laptop with Ubuntu, use 'dev-box' as computername
- create a user called 'dev' (if this is not the case, the puppet scripts will create a user called 'dev')
- download the contents of the 'puppet' folder within this repo (make sure to keep the folder structure as is) and place the files and folders somewhere, Documents folder for example
- start by running the shell script 'install-puppet.sh', this will download and install puppet for Ubuntu
- then continue by running the shell script 'run-puppet.sh', this will use puppet to execute the puppet manifests which will install java, eclipse, maven, etc. (when running the script as 'dev' user, comment the line 'sudo puppet apply $NOOP ./puppet-manifests/add-dev-user.pp')

### Manual steps
After the needed software has downloaded and installed and the configuration has been made, continue with these manual steps:

- open eclipse and import the projects like so: File -> Import -> Existing Maven Projects, browse to folder /home/dev/Sources and start with Shared, then Platform and then Protocol-Adapter-OSLP
- show the 'Debug' and 'Git' perspectives
- in the 'Debug' perspective, go to the 'Servers' view and add a new Apache Tomcat7 server, Tomcat7 is available in the folder /home/dev/Downloads/apache-tomcat-7.0.61
- after adding the server, double click on the Tomcat server in the 'Servers' view and set the following configuration: under 'Timeouts' set 'Start' to 600 and 'Stop' to 300
- then click on 'Open launch configuration', click on the 'Arguments' tab and add the following to the 'VM arguments': -Xms512m -Xmx2048m -Xss512k -XX:MaxPermSize=1024m -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -Dcom.sun.management.jmxremote=true
- continue with adding the project to the Tomcat server by right clicking on the Tomcat server and choosing 'Add and Remove', and clicking on the 'Add All' button
- at this point, eclipse's auto-build should have built the projects, and the Tomcat server has been setup

- continue with starting Apache ActiveMQ: open a terminal and go to the folder /home/dev/Downloads/apache-activemq-5.11.1/bin/linux-x86-64 and then use the command: sudo ./activemq console
- with ActiveMQ running, the Tomcat7 server can be started

- open pgAdminIII and configure a connection: choose the 'Add a connection to a server.' and fill out the fields using Host localhost, Port 5432, Username osp_admin and Password 1234

- make sure to set your GitHub user name and e-mail address using these commands: git config --global user.name "Your Name" and git config --global user.email "me@github.com"

### Excluded
The repo Integration-Test containing a FitNesse test suite, is not included in this development environment.

## What does this repo contain?
This repo contains the following files:

- *.properties files with key-value-pairs for Java apps
- *-logback.xml files for <a href="http://logback.qos.ch">logback</a>
- context.xml file for <a href="http://tomcat.apache.org">Apache Tomcat</a>
- vhost for <a href="http://httpd.apache.org">Apache HTTP Server</a>
- localhost.cert.pem, localhost.key.pem and cacert.cer for <a href="http://httpd.apache.org">Apache HTTP Server</a>
- trust.jks, org.cert.pem, org.pfx used for webservice security
- sql script to create users and databases
- *.der files for secure communication with smart devices
- settings.xml file for <a href="https://maven.apache.org">Apache Maven</a>
- puppet scripts and manifests
