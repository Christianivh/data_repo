# Archivo de configuracion rapida de hadoop

instalar para Linux, preferible hacerlo 1 por 1.:

```
sudo apt install openjdk-8-jdk openjdk-8-jre

wget https://archive.apache.org/dist/hadoop/common/stable/hadoop-3.2.1.tar.gz

tar xfz hadoop-3.2.1.tar.gz

mv hadoop-3.2.1 hadoop

rm hadoop-3.2.1.tar.gz

sudo apt-get install ssh

sudo apt-get install rsync

ssh-keygen -t rsa -P ''

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

```

alterar archivo

```
nano ~/.bashrc
```

Agregar las siguiente lineas, al final

```

#HADOOP VARIABLES START
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/home/osboxes/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
#HADOOP VARIABLES END

```

Ejecutar comnando para actualizar variables de entorno:

```
source ~/.bashrc

mkdir -p /home/osboxes/hadoop_store/hdfs/namenode
mkdir -p /home/osboxes/hadoop_store/hdfs/datanode

```


```
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/core-site.xml

wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/hdfs-site.xml

wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/mapred-site.xml

wget https://raw.githubusercontent.com/Christianivh/data_repo/master/hadoop/config_files/yarn-site.xml


```

copiar al directorio de hadoop
```
cp core-site.xml /home/osboxes/hadoop/etc/hadoop/core-site.xml

cp hdfs-site.xml /home/osboxes/hadoop/etc/hadoop/hdfs-site.xml

cp mapred-site.xml /home/osboxes/hadoop/etc/hadoop/mapred-site.xml

cp yarn-site.xml /home/osboxes/hadoop/etc/hadoop/yarn-site.xml

```
