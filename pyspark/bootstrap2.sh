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
echo "################### GIT  ###########################"
sudo apt-get install -y git
echo ""
echo "################### AWSCLI  ###########################"
sudo apt-get install -y awscli
echo ""
echo "################### SCLA  ###########################"
sudo apt-get install -y scala
echo ""
echo "################### python3  ###########################"
sudo apt-get install -y python3.8.3
echo ""
echo "################### python3-pip  ###########################"
sudo apt-get install -y python3-pip
echo ""
echo "################### python3-pip  ###########################"
sudo apt-get install -y python3-dev
echo ""
echo "################### ipython ###########################"
sudo apt-get install -y ipython
echo ""
echo "################### jupyter ###########################"
sudo apt-get install -y jupyter


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
wget https://downloads.apache.org/spark/spark-2.4.7/spark-2.4.7-bin-hadoop2.7.tgz

echo "##############################################"
echo "Step 11: Decompress hadoop file"
echo "##############################################"
tar xfz spark-2.4.7-bin-hadoop2.7.tgz

echo "##############################################"
echo "Step 3: rename directory"
echo "##############################################"
mv spark-2.4.7-bin-hadoop2.7 spark
rm spark-2.4.7-bin-hadoop2.7.tgz

echo "##############################################"
echo "Step 6: Add PYSPARK environment variable in bashrc "
echo "##############################################"

echo "#PYSPARK VARIABLES START" >> ~/.bashrc
echo "export PYTHONPATH=\$SPARK_HOME/python:\$PYTHONPATH" >> ~/.bashrc
echo "export PYSPARK_DRIVER_PYTHON=jupyter" >> ~/.bashrc
echo "export PYSPARK_DRIVER_PYTHON_OPTS=notebook" >> ~/.bashrc
echo "export PYSPARK_PYTHON=python3" >> ~/.bashrc
echo "#PYSPARK VARIABLES END" >> ~/.bashrc
echo "" >> ~/.bashrc

echo ""
echo "################### pyspark  ###########################"
sudo pip3 install py4j

mkdir workspace

wget https://raw.githubusercontent.com/Christianivh/data_repo/master/pyspark/GetStart.ipynb
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/pyspark/username.csv

mv GetStart.ipynb workspace/GetStart.ipynb
mv username.csv workspace/username.csv

exec bash
