## Install java 8 and net-tools
apt update
apt install openjdk-8-jre-headless
apt install net-tools

## Download nexus tar file and un tar it
cd /opt
wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar -zxvf latest-unix.tar.gz

## Create Nexus User and give him permissions on folders
adduser nexus
chown -R nexus:nexus nexus
chown -R nexus:nexus sonatype-work

## Edit file to run as nexus user
vim /opt/nexus/bin/nexus.rc
run_as_user="nexus"

## Start nexus
su - nexus
/opt/nexus/bin/nexus start

## Verify nexus is running successfully
ps aux | grep nexus
netstat -plnt