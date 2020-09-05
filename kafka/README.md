# Guia rapida


## Instalación de todos los servicios necesarios

Esta es un archivo bootstrap, el cual trae la instalación y configuración de:

- JAVA 8 jre/jdk
- scala
- kafka

```
sudo apt-get install wget
wget https://raw.githubusercontent.com/Christianivh/data_repo/master/kafka/bootstrap.sh
bash bootstrap.sh

```

## Inicio Servicio: Kafka-Zookeper
Abrir un nuevo terminal

```
cd kafka

bin/zookeeper-server-start.sh config/zookeeper.properties

```
## Inicio Servicio: Kafka-server
Abrir un nuevo terminal

```
cd kafka

bin/kafka-server-start.sh config/server.properties

```

copyright!
