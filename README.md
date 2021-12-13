# AETE
Automated Exploratory Test Environments

### How to build and push image?
```
$ docker buildx create --name mybuilder
$ docker buildx use mybuilder
$ docker buildx inspect --bootstrap
$ docker buildx build --platform linux/arm,linux/amd64 -t changjoon/aete:0.0.5 --push .
```
