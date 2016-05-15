## Libresonic Dockerfile

This repository contains **Dockerfile** for [Libresonic](http://libresonic.org)

## Dependencies

You need will need [Docker](https://www.docker.com/).

## Usage

Start Libresonic docker contained by running:

```
docker run --name libresonic -p 80:8080 -v <PATH_TO_YOUR_MUSIC>:/var/music tonipes/libresonic-docker
```
