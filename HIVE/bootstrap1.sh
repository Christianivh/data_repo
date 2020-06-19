#!/bin/bash
echo "##############################################"
echo "Step 0: Install aplications librarys"
echo "##############################################"
echo ""
sudo apt-get update
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
echo "################### python3  ###########################"
sudo apt-get install -y python3.7
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
echo "################### GIT  ###########################"
sudo apt-get install -y git
echo ""
echo "################### AWSCLI  ###########################"
sudo apt-get install -y awscli

echo "##############################################"
echo "Step 1: Download hadoop dsitributed 3.2.1 file"
echo "##############################################"
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz
wget http://apache.rediris.es/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz

echo "##############################################"
echo "Step 2: Decompress hadoop / hive files"
echo "##############################################"
tar xfz hadoop-3.1.2.tar.gz
tar xfz apache-hive-3.1.2-bin.tar.gz

echo "##############################################"
echo "Step 3: rename directory"
echo "##############################################"
mv hadoop-3.1.2 hadoop
mv apache-hive-3.1.2-bin hive
rm hadoop-3.1.2.tar.gz

echo "##############################################"
echo "Step 5: Generate the key rsa "
echo "##############################################"
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

echo "##############################################"
echo "Step 6: Add hadoop environment variable in bashrc "
echo "##############################################"
echo "" >> ~/.bashrc
echo "#HADOOP VARIABLES START" >> ~/.bashrc
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.bashrc
echo "export HADOOP_HOME=/home/$1/hadoop" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >> ~/.bashrc
echo "export PATH=\$PATH:\$HADOOP_HOME/sbin" >> ~/.bashrc
echo "export HADOOP_MAPRED_HOME=\$HADOOP_HOME" >> ~/.bashrc
echo "export HADOOP_COMMON_HOME=\$HADOOP_HOME" >> ~/.bashrc
echo "export HADOOP_HDFS_HOME=\$HADOOP_HOME" >> ~/.bashrc
echo "export HADOOP_YARN_HOME=\$HADOOP_HOME" >> ~/.bashrc
echo "export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native" >> ~/.bashrc
echo "export HADOOP_OPTS=\"-Djava.library.path=\$HADOOP_HOME/lib/native\"" >> ~/.bashrc
echo "#HADOOP VARIABLES END" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# HIVE VARIABLES START" >> ~/.bashrc
echo "export HIVE_HOME=/home/$1/hive" >> ~/.bashrc
echo "export PATH=\$PATH:\$HIVE_HOME/bin" >> ~/.bashrc
echo "# HIVE VARIABLES END" >> ~/.bashrc
echo "" >> ~/.bashrc

echo "##############################################"
echo "Step 7: refresh bashrc environment "
echo "##############################################"
source ~/.bashrc
mkdir -p ~/hadoop_store/hdfs/namenode
mkdir -p ~/hadoop_store/hdfs/datanode


echo "##############################################"
echo "Step 8: Config file in hadoop"
echo "##############################################"
echo ""
echo "################### download files xml  ###########################"
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/core-site.xml
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/hdfs-site.xml
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/mapred-site.xml
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/yarn-site.xml
echo ""
echo "################### copy to hadoop download files ###########################"
cp core-site.xml ~/hadoop/etc/hadoop/core-site.xml
cp hdfs-site.xml ~/hadoop/etc/hadoop/hdfs-site.xml
cp mapred-site.xml ~/hadoop/etc/hadoop/mapred-site.xml
cp yarn-site.xml ~/hadoop/etc/hadoop/yarn-site.xml

sed -i "s/osboxes/$1/" ~/hadoop/etc/hadoop/hdfs-site.xml

echo ""
echo "################### remove temporal files ###########################"
rm core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml
echo ""
echo "################### alter hadoop environment file ###########################"
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/hadoop/etc/hadoop/hadoop-env.sh

source ~/.bashrc

exec bash
