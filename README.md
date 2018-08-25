docker-rserve
=============

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/phdax/docker-rserve/)

## Run
### simply
```
docker run -dit --name rserve-simple -p 6312:6312 phdax/docker-rserve
```
### persist library and workspace
```
docker run -dit --name rserve-simple -p 6312:6312 \
-v [LOCAL LIB DIR]:/opt/r/lib \
-v [LOCAL WORK DIR]:/opt/r/work \
phdax/docker-rserve
```

## Usage
(default)\
user : admin\
pass : admin\
port : 6312

## License
[GPL2](https://github.com/phdax/docker-rserve-tls-selfsigned/blob/master/LICENSE)
