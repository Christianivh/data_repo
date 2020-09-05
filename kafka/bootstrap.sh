#!/usr/bin/env bash
echo "##############################################"
echo "Step 0: Install aplications librarys"
echo "##############################################"
sudo apt-get update
echo "################### JAVA  ###########################"
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y openjdk-8-jre
echo "################### SCALA  ###########################"
sudo apt-get install -y scala
echo "################### DOWNLOAD KAFKA  ###########################"
wget https://downloads.apache.org/kafka/2.5.0/kafka_2.12-2.5.0.tgz
echo "################### UNZIP and Rename  ###########################"
tar xfz kafka_2.12-2.5.0.tgz
mv kafka_2.12-2.5.0 kafka
