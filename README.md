# symfony_CICDCD

Install the dependances
```
composer install
```

Create the database and make the migrations
```
symfony console doctrine:database:create
symfony console doctrine:migration:migrate
```

Try locally
```
symfony serve
```

If needed deploy a myslq container
```
docker run --name symfony-mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root mysql
```

Get the IP adress of mysql container
```
docker inspect symfony-mysql
```

Change the connection string in the .env line 27 with the IP adress of mysql container
Create database in mysql container and make the migration
```
symfony console doctrine:database:create
symfony console doctrine:migration:migrate
```

Build the image and deploy as container
```
docker build . -t symfony-cicdcd
docker run --name symfony_cicdcd_container -p 8080:80 symfony-cicdcd
```

CICDCD in Docker environment

Require :
- Docker Engine instal

If not already done start an instance of jenkins_master
```
docker run --name jenkins -p <choose_a_port>:8080 jenkins/jenkins
```

Then build and start an instance of a jenkins_agent
If your are on Windows, execute this command in Powershell or cmd
```
cd Jenkins-agent
docker build -t jenkins-agent-with-docker-and-composer .
docker run --init --name jenkins_agent_composer -v /var/run/docker.sock:/var/run/docker.sock jenkins-agent-with-docker-and-composer -url http://<Jenkins_master_IP_adress>:8080 <secret> <agent_name>
```

Want to try the entire CICD on your own repository and registry ?