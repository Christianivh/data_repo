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

echo "##############################################"
echo "Step 1: Download hadoop dsitributed 3.2.1 file"
echo "##############################################"
wget https://archive.apache.org/dist/hadoop/common/hadoop-3.2.1/hadoop-3.2.1.tar.gz

echo "##############################################"
echo "Step 2: Decompress hadoop file"
echo "##############################################"
tar xfz hadoop-3.2.1.tar.gz

echo "##############################################"
echo "Step 3: rename directory"
echo "##############################################"
mv hadoop-3.2.1 hadoop
rm hadoop-3.2.1.tar.gz

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
echo "export HADOOP_HOME=/home/osboxes/hadoop" >> ~/.bashrc
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
cp core-site.xml /home/osboxes/hadoop/etc/hadoop/core-site.xml
cp hdfs-site.xml /home/osboxes/hadoop/etc/hadoop/hdfs-site.xml
cp mapred-site.xml /home/osboxes/hadoop/etc/hadoop/mapred-site.xml
cp yarn-site.xml /home/osboxes/hadoop/etc/hadoop/yarn-site.xml
echo ""
echo "################### remove temporal files ###########################"
rm core-site.xml hdfs-site.xml mapred-site.xml yarn-site.xml
echo ""
echo "################### alter hadoop environment file ###########################"
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/hadoop/etc/hadoop/hadoop-env.sh

exec bash


echo "##############################################"
echo "Step 9: format HDFS "
echo "##############################################"
cd hadoop
hdfs namenode –format

echo "##############################################"
echo "Step 10: start  daemons {HDFS, YARN, HISTORY} "
echo "##############################################"
~/hadoop/sbin/start-all.sh
~/hadoop/sbin/mr-jobhistory-daemon.sh start historyserver
