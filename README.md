# symfony_CICDCD

Install the dependances
```
composer install
```

Try locally
```
symfony serve
```

Build the image and deploy as container
```
docker build . -t symfony-cicdcd
docker run --name symfony_cicdcd_container -p 8080:80 symfony-cicdcd
```