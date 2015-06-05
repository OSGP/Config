# Config
Configuration for OSGP components and development environment.

## Minimal hardware requirements

- Core i5 / i7 2.5GHz (or more powerfull)
- 8 GB of RAM
- About 25 GB of disk space (preferably more)

## Setup development environment
To set up a development environment using Ubuntu and have puppet install everything you need, follow these steps:

- get an [Ubuntu 14.04.2 LTS live cd](http://www.ubuntu.com/download/desktop)
- install a virtual machine or laptop with Ubuntu, use 'dev-box' as computername
- create a user called 'dev'
- download the contents of the 'puppet' folder within this repo (make sure to keep the folder structure as is) and place the files and folders somewhere, Documents folder for example
- start by running the shell script 'install-puppet.sh', this will download and install puppet for Ubuntu
- then continue by running the shell script 'run-puppet.sh', this will use puppet to execute the puppet manifests which will install java, eclipse, maven, etc.

### Manual steps
After the needed software has downloaded and installed and the necessary configuration has been made, continue with these manual steps:

- open eclipse (the executable can be found in the folder /home/dev/Downloads/eclipse*/eclipse) and import the projects: File -> Import -> Existing Maven Projects, browse to folder /home/dev/Sources and start with the  Shared project, then the Platform project and then the Protocol-Adapter-OSLP project
- show the 'Debug' and 'Git' perspectives
- in the 'Debug' perspective, go to the 'Servers' view and add a new Apache Tomcat7 server, Tomcat7 is available in the folder /home/dev/Downloads/apache-tomcat-7.0.61
- after adding the server, double click on the Tomcat server in the 'Servers' view and set the following configuration: under 'Timeouts' set 'Start' to 600 and 'Stop' to 300
- then click on 'Open launch configuration', click on the 'Arguments' tab and add the following at the end of the 'VM arguments' string: -Xms512m -Xmx2048m -Xss512k -XX:MaxPermSize=1024m -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -Dcom.sun.management.jmxremote=true
- create a symlink to the Maven setting file using this command: sudo ln -s /home/dev/Sources/Config/maven/settings.xml /home/dev/.m2
- setup the Tomcat7 context.xml in the eclipse Servers folder, by copying the entries in /home/dev/Sources/Config/tomcat/context.xml to map configuration file names to file paths
- continue by adding the Maven Projects to the Tomcat server by right clicking on the Tomcat server and choosing 'Add and Remove', followed by clicking on the 'Add =All' button
- at this point, eclipse's auto-build should have built the projects, and the Tomcat server has been setup

- continue with starting Apache ActiveMQ (the executable can be found in the folder /home/dev/Downloads/apache-activemq-*/bin/linux-x86-64): by opening a terminal and use the command: sudo ./activemq console to start ActiveMQ as a terminal process (this way, ActiveMQ doesn't detach from the terminal and starts running as a daemon)
- with ActiveMQ running, the Tomcat7 server can be started

- open pgAdminIII and configure a connection: choose the 'Add a connection to a server.' and fill out the fields using Host localhost, Port 5432, Username osp_admin and Password 1234
- run the script (/home/dev/Sources/Config/sql/create-test-org.sql) to insert 'test-org' organization into the organisation table of the osgp_core database

### SoapUI setup
In order to use the webservice, SoapUI can be used.

- download SoapUI from http://sourceforge.net/projects/soapui
- make the SoapUI-x64-*.sh script executable and start it
- follow the steps of the installer
- start SoapUI
- goto File -> Preferences -> SSL Settings and browse for the KeyStore to /home/dev/Sources/Config/certificates/osgp-ca/certs/test-org.pfx and fill out the password (the password is 1234)
- go to WSDL Settings and check 'generate example values in new requests' and 'generate comments with type information in new requests'

- create a new SOAP Project and call it admin
- in the project view goto 'WS-Security Configurations' and open the tab 'Keystores' and add the test-org.pfx file there
- right click the admin project and choose 'Add WSDL' using url https://localhost/osgp-adapter-ws-admin/wsdl/Admin/DeviceManagement.wsdl

- create a new SOAP Project and call it public-lighting
- in the project view goto 'WS-Security Configurations' and open the tab 'Keystores' and add the test-org.pfx file there
- right click the public-lighting project and choose 'Add WSDL' using url https://localhost/osgp-adapter-ws-publiclighting/wsdl/PublicLighting/PublicLightingAdHocManagement.wsdl

- in the interface properties for a request, choose test-org.pfx as SSL Keystore (NOTE THAT THIS HAS TO BE DONE FOR EACH REQUEST)

- a SSLD needs to be added, together with a public key. The UpdateKey function of the admin webservice offers that functionality. Choose the UpdateKey request from the admin SOAP Project using this example:
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.alliander.com/schemas/osgp/common/2014/10" xmlns:ns1="http://www.alliander.com/schemas/osgp/admin/devicemanagement/2014/10">
   <soapenv:Header>
      <ns:ApplicationName>APPLICATION_NAME</ns:ApplicationName>
      <ns:UserName>USER_NAME</ns:UserName>
      <ns:OrganisationIdentification>test-org</ns:OrganisationIdentification>
   </soapenv:Header>
   <soapenv:Body>
      <ns1:UpdateKeyRequest>
         <ns1:DeviceIdentification>SSLD_000-00-01</ns1:DeviceIdentification>
         <ns1:PublicKey>MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEFhUImXFJdqmputquVAc2CPdnn9Ju00M3m/Ice7wABNN+oAYKQbw/OceqvZmFF1+r4nO/vCm/f1JO5nEorE2jNQ==</ns1:PublicKey>
      </ns1:UpdateKeyRequest>
   </soapenv:Body>
</soapenv:Envelope>
```
- after the SSLD has been added, let's see if the FunctionFindAllDevices shows the SSLD. Continue with the FindAllDevices request from the public-lighting SOAP Project using this example:
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.alliander.com/schemas/osgp/common/2014/10" xmlns:ns1="http://www.alliander.com/schemas/osgp/publiclighting/adhocmanagement/2014/10">
   <soapenv:Header>
      <ns:ApplicationName>APPLICATION_NAME</ns:ApplicationName>
      <ns:UserName>USER_NAME</ns:UserName>
      <ns:OrganisationIdentification>test-org</ns:OrganisationIdentification>
   </soapenv:Header>
   <soapenv:Body>
      <ns1:FindAllDevicesRequest>
         <ns1:Page>0</ns1:Page>
      </ns1:FindAllDevicesRequest>
   </soapenv:Body>
</soapenv:Envelope>
```

- the response should contain SSLD_000-00-01:
```xml
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
   <SOAP-ENV:Header/>
   <SOAP-ENV:Body>
      <ns2:FindAllDevicesResponse xmlns:ns2="http://www.alliander.com/schemas/osgp/publiclighting/adhocmanagement/2014/10" xmlns:ns3="http://www.alliander.com/schemas/osgp/common/2014/10">
         <ns2:DevicePage>
            <ns2:TotalPages>1</ns2:TotalPages>
            <ns2:Devices>
               <ns2:DeviceIdentification>SSLD_000-00-01</ns2:DeviceIdentification>
               <ns2:DeviceType>SSLD</ns2:DeviceType>
               <ns2:Activated>false</ns2:Activated>
               <ns2:HasSchedule>false</ns2:HasSchedule>
               <ns2:PublicKeyPresent>true</ns2:PublicKeyPresent>
            </ns2:Devices>
         </ns2:DevicePage>
      </ns2:FindAllDevicesResponse>
   </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

- in order to be able to use SSLD_000-00-01, the device needs to be created in the device simulator. Open the OSLP device simulator: https://localhost/web-device-simulator/devices
- click on 'Add Device' and fill out the fields like so: 'Device identification' SSLD_000-00-01, 'IP address' 127.0.0.1 and 'Device type' SSLD, then click on 'Create Device'
- then, click on the newly created device, and click the 'Register device' button
- wait a little while until the message 'Device with identification SSLD_000-00-01 was registered at 20150507112143.' appears
- then click on the 'Confirm device registration', the message should read: 'Device with identification SSLD_000-00-01 was confirmed to be registered.'

- now the device is known in the platform, and the device simulator has been set up, the device can be used. Let's try to switch on the light. Using SoapUI again, issue a SetLight request using the public-lighting SOAP Project:
```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns="http://www.alliander.com/schemas/osgp/common/2014/10" xmlns:ns1="http://www.alliander.com/schemas/osgp/publiclighting/adhocmanagement/2014/10">
   <soapenv:Header>
      <ns:ApplicationName>APPLICATION_NAME</ns:ApplicationName>
      <ns:UserName>USER_NAME</ns:UserName>
      <ns:OrganisationIdentification>test-org</ns:OrganisationIdentification>
   </soapenv:Header>
   <soapenv:Body>
      <ns1:SetLightRequest>
         <ns1:DeviceIdentification>SSLD_000-00-01</ns1:DeviceIdentification>
         <!--1 to 6 repetitions:-->
         <ns1:LightValue>
            <!--Optional:-->
            <ns1:Index>0</ns1:Index>
            <ns1:On>1</ns1:On>
            <!--Optional:-->
            <ns1:DimValue>100</ns1:DimValue>
         </ns1:LightValue>
      </ns1:SetLightRequest>
   </soapenv:Body>
</soapenv:Envelope>
```
- in the home screen of the OSLP device simulator, the lightbulb should light up for SSLD_000-00-01

### Contributing
Tell us what you think, add some code or change something.

- if you have any feedback, issues or want to change something, we would love to hear from you. Create an issue on GitHub, or send us a pull request!
- before doing any commits and pull requests, make sure to set your GitHub user name and e-mail address using these commands: git config --global user.name "Your Name" and git config --global user.email "me@github.com"

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
