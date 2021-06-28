
# SPARK WITH DOCKER

En este tutorial veremos como levantar una maquina de Spark en contenedores Docker. 

Levantaremos en una maquina virtual (Virtual Box con Ubuntu), un cluster de spark, el cual estara compuesto por un master y 2 nodos.

![docker](imagen/spark_docker.png)

Requerimientos para conseguir el procedimiento existosamente. 

- Windows 10 o mayor.
- 6Gb de memoria o mayor.
- Hipervirtualización activado.
- tener instalado VirtualBox.

Procedimiento:

1. Imagen de Ubuntu <br> 
   1.1 Descargar ubuntu 20.04  <br>
   Descarga la imagen ubuntu desde la pagina de osboxes, 
   [Descargar AQUI](https://www.osboxes.org/ubuntu/#ubuntu-20-04-vbox "Imagen OSBOXES Descargar") Ubuntu 20.04, desde la pestaña de virtual box. En la pestaña de info encontraremos la contraseña de la imagen.
   <br>
   ![docker](imagen/ubuntu20_04.png)

   1.2 levantarlo en VirtualBox  <br>
   Crear una nueva maquina virtual, configurarla para que tome al menos 6GB.

2. Actualizar imagen de Ubuntu
   ```
   sudo apt-get update
   ```
   
3. Instalar docker en ubuntu
   
   Para instalar Docker en nuestra maquina, vaya paso a paso:

   Instalar Docker
   ```
   sudo apt install docker.io
   ```

   Iniciar el servicio   
   ```
   sudo systemctl enable --now docker
   ```

   Agregar un usuario, como admin grupo docker, paso opcional. 
   ```
   sudo usermod -aG docker    
   ```

   La guia se ha basado en la [Web1](https://linuxconfig.org/how-to-install-docker-on-ubuntu-20-04-lts-focal-fossa "Configurar Docker"), [Web2](https://docs.docker.com/engine/install/ubuntu/ "Docker oficial")
   

4. Descargar spark

   La imagen que se descargara es del mismo sitio de [Spark](https://spark.apache.org/downloads.html "Spark Download")
   
   ```   
   wget https://archive.apache.org/dist/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
   ```
   
   Una vez que termine la descarga descomprima el archivo
   ```   
   tar -xvf spark-3.1.2-bin-hadoop3.2.tgz
   ```
   
5. Levantar containers:

   ```
   sudo docker run -it --rm --memory 2Gb --cpus 1 ubuntu

   apt update && apt install -y openjdk-8-jdk python nano net-tools
   ```

6. Configurar Spark en containers:
   Desde el entorno principal.
   
   ```
   sudo docker cp  spark-3.1.2-bin-hadoop3.2 452:/opt
   ```
   
7. Levantar Spark en containers:

   Conocer la ip del container
   ```
   ifconfig
   ```

   Master
   ```   
   cd opt/spark-3.1.2-bin-hadoop3.2/
   
   sbin/start-master.sh -h 0.0.0.0
   ```

   slaves/Nodes
   ```
   # sbin/start-slave.sh spark://172.17.0.2:7077
   sbin/start-slave.sh spark://<IP_MASTER>:7077

   ```
