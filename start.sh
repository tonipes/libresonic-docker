#!/bin/sh -e

SUBSONIC_HOME=/var/subsonic
SUBSONIC_HOST=0.0.0.0
SUBSONIC_PORT=4040
SUBSONIC_HTTPS_PORT=0
SUBSONIC_CONTEXT_PATH=/
SUBSONIC_MAX_MEMORY=200
SUBSONIC_PIDFILE=
SUBSONIC_DEFAULT_MUSIC_FOLDER=/music
SUBSONIC_DEFAULT_PODCAST_FOLDER=${SUBSONIC_HOME}/podcasts
SUBSONIC_DEFAULT_PLAYLIST_FOLDER=${SUBSONIC_HOME}/playlists

SUBSONIC_USER=subsonic

export LANG=POSIX
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export LANG="en_US.utf8"
export LANGUAGE="en_US.utf8"
export LC_CTYPE="en_US.utf8"
export LC_ALL="en_US.UTF-8"

quiet=0

echo "Starting"

# Create Subsonic home directory.
mkdir -p \
    ${SUBSONIC_HOME} \
    ${SUBSONIC_DEFAULT_PODCAST_FOLDER} \
    ${SUBSONIC_DEFAULT_PLAYLIST_FOLDER} \
    /tmp/subsonic

LOG=${SUBSONIC_HOME}/subsonic_sh.log
truncate -s0 ${LOG}


cd /usr/share/subsonic

exec /usr/bin/java -Xmx${SUBSONIC_MAX_MEMORY}m \
    -Dsubsonic.home=${SUBSONIC_HOME} \
    -Dsubsonic.host=${SUBSONIC_HOST} \
    -Dsubsonic.port=${SUBSONIC_PORT} \
    -Dsubsonic.httpsPort=${SUBSONIC_HTTPS_PORT} \
    -Dsubsonic.contextPath=${SUBSONIC_CONTEXT_PATH} \
    -Dsubsonic.defaultMusicFolder=${SUBSONIC_DEFAULT_MUSIC_FOLDER} \
    -Dsubsonic.defaultPodcastFolder=${SUBSONIC_DEFAULT_PODCAST_FOLDER} \
    -Dsubsonic.defaultPlaylistFolder=${SUBSONIC_DEFAULT_PLAYLIST_FOLDER} \
    -Djava.awt.headless=true \
    -jar subsonic-booter-jar-with-dependencies.jar >> ${LOG} 2>&1

exec tail -f ${LOG}
