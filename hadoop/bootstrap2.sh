#!/bin/bash
echo "##############################################"
echo "Step 0: Install aplications librarys"
echo "##############################################"
echo ""
echo "################### SSH  ###########################"
sudo apt-get install -y ssh
echo ""
echo "################### RSYNC  ###########################"
sudo apt-get install -y rsync
echo ""
echo "################### JDK  ###########################"
sudo apt-get install -y openjdk-8-jdk
echo ""
echo "################### JRE  ###########################"
sudo apt-get install -y openjdk-8-jre
echo ""
echo "################### JRE  ###########################"
sudo apt-get install -y git
echo ""
echo "################### JRE  ###########################"
sudo apt-get install -y awscli
echo ""
echo "################### JRE  ###########################"
sudo apt-get install -y scala

echo "##############################################"
echo "Step 5: Generate the key rsa "
echo "##############################################"
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

echo "##############################################"
echo "Step 6: Add SPARK environment variable in bashrc "
echo "##############################################"
echo "#SPARK VARIABLES START" >> ~/.bashrc
echo "export SPARK_HOME=/home/osboxes/spark" >> ~/.bashrc
echo "export PATH=\$SPARK_HOME/bin:\$PATH" >> ~/.bashrc
echo "#SPARK VARIABLES END" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "##############################################"
echo "Step 10: download spark"
echo "##############################################"
wget https://downloads.apache.org/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz

echo "##############################################"
echo "Step 11: Decompress hadoop file"
echo "##############################################"
tar xfz spark-2.4.5-bin-hadoop2.7.tgz

echo "##############################################"
echo "Step 3: rename directory"
echo "##############################################"
mv spark-2.4.5-bin-hadoop2.7 spark
rm spark-3.0.0-preview2-bin-hadoop2.7.tgz

exec bash
