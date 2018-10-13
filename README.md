## DEPRECATED

This repo is deprecated as I moved to [airsonic](https://airsonic.github.io/). It has an official [official docker image](https://hub.docker.com/r/airsonic/airsonic/).

## Libresonic Dockerfile

This repository contains **Dockerfile** for [Libresonic](http://libresonic.org).

Setup is tested only in linux environment. However, it should work with any OS where docker is avalilable.

## Dependencies

You need will need [Docker](https://www.docker.com/).

## Usage

Start Libresonic docker contained by running:

```
docker run --name libresonic -p 80:8080 -v <PATH_TO_YOUR_MUSIC>:/var/music tonipes/libresonic-docker
# -p 80:8080 maps your port 80 to docker container port 8080
# -v /.../:/var/music mounts your music library to container path /var/music
```

Docker will download image `tonipes/libresonic-docker` and setup container for you.

When done, libresonic will be avalilable at:

```
http://localhost/
OR
http://<YOUR_IP_HERE>/
```

## Known issues

### Transcoding

There might be issues with transcoding.

If `.flac` files won't play, you can try to change transcoding options to not use ffmpeg. See [ArchWiki](https://wiki.archlinux.org/index.php/Subsonic#FLAC_playback).

