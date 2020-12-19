# Guia rapida instalación Hadoop y HIVE SQL


## Instalación de todos los servicios necesarios

Esta es un archivo bootstrap, el cual trae la instalación y configuración de:

- Java 8
- hadoop.3.1.2
- hive.3.1.2
- python3.7
- pip3
- git
- awscli


## Workdir directorio raiz del usuario.

```
sudo apt-get install wget
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/HIVE/bootstrap1.sh -O boostrap.sh
bash boostrap.sh "$(whoami)"

```

## Formatear Namespace del HDFS

Una vez finalizada la instalación de hadoop, proceda a formatear

```{shell}
source ~/.bashrc

cd hadoop

hdfs namenode –format
```

## Iniciar Servicios

Proceda a iniciar los servicios de HDFS / YARN /

```{shell}
sbin/start-all.sh

sbin/mr-jobhistory-daemon.sh start historyserver
```


## Crear carpetas en el HDFS
Proceda a crear carpetas en el HDFS para el funcionamiento de HIVE

```{shell}

hdfs dfs -mkdir /tmp
hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hive/
hdfs dfs -mkdir /user/hive/warehouse

hdfs dfs -chmod g+w /tmp
hdfs dfs -chmod g+w /user/hive/warehouse

```


## Iniciar schema Hive
Proceda a iniciar los servicios del schema de hive

```{shell}
cd ~/hive

schematool -dbType derby -initSchema

hive

```

## Configuración Manual

Instalar HIVE:
```{shell}

wget http://apache.rediris.es/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
tar -xvf apache-hive-3.1.2-bin.tar.gz
mv apache-hive-3.1.2-bin hive

```

Configurar variables de entorno:

```{shell}
nano ~/.bashrc

# HIVE VARIABLES START
export HIVE_HOME=/home/osboxes/hive
export PATH=$PATH:$HIVE_HOME/bin
# HIVE VARIABLES END

source ~/.bashrc

```

copyright!
