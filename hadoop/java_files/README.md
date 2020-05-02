# Practica MapReduce

Esto es un readme, para ayudar en la practica

Compilar WordCount.java:

```commandline
sudo javac -classpath $HADOOP_HOME/share/hadoop/common/hadoop-common-3.1.2.jar:$HADOOP_HOME/share/hadoop/common/lib/hadoop-annotations-3.1.2.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-core-3.1.2.jar /home/osboxes/mapreduce/WordCount.java

sudo jar cf wc.jar WordCount*.class
```


```
hadoop jar wc.jar WordCount /user/bigdata/wc-in /user/bigdata/wc-out
```


Compilar LineCount.java  y ejecutarlo:
```
sudo javac -classpath $HADOOP_HOME/share/hadoop/common/hadoop-common-3.1.2.jar:$HADOOP_HOME/share/hadoop/common/lib/hadoop-annotations-3.1.2.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-core-3.1.2.jar /home/osboxes/mapreduce/LineCount.java

sudo jar cf LineCount.jar LineCount*.class

hadoop jar LineCount.jar LineCount /user/bigdata/line-count-in /user/bigdata/line-count-out

```



Fin