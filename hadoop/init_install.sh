
sudo apt install openjdk-8-jdk openjdk-8-jre

wget https://archive.apache.org/dist/hadoop/common/stable/hadoop-3.2.1.tar.gz

tar xfz hadoop-3.2.1.tar.gz

mv hadoop-3.2.1 hadoop

rm hadoop-3.2.1.tar.gz

sudo apt-get install ssh

sudo apt-get install rsync

ssh-keygen -t rsa -P ''

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
