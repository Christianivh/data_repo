
# EC2 FIRTS STEPS

Create a Ec2 with Apache Services


## First step - manual

```
sudo su

yum update
yum install -y httpd.x86_64
```


```
# start services
systemctl start httpd.service

# persist cross rebot
systemctl enable httpd.service
```

validate internal
```
curl localhost:80

```

test another own page
```
echo "Class 2021 - Post elecciones" > /var/www/html/index.html

echo "Class 2021 From $(hostname -f)" > /var/www/html/index.html
```



## Second step - USER DATA
```
#!/bin/bash
yum update -y
yum install -y httpd
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo echo "BPC from $(hostname -f)" > /var/www/html/index.html

```



