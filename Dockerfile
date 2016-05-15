FROM debian:jessie

MAINTAINER tonipes "pesola.toni@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    apt-get update && \
    apt-get install --yes --force-yes --no-install-recommends --no-install-suggests locales && \
    apt-get install --yes --force-yes --no-install-recommends --no-install-suggests openjdk-7-jdk && \
    apt-get install --yes --force-yes --no-install-recommends --no-install-suggests maven && \
    apt-get install --yes --force-yes --no-install-recommends --no-install-suggests git && \
    apt-get install --yes --force-yes --no-install-recommends --no-install-suggests fakeroot && \
    apt-get install --yes --force-yes --no-install-recommends --no-install-suggests lintian && \
    apt-get clean && \
    /usr/sbin/locale-gen

RUN git clone git://github.com/Libresonic/libresonic.git && \
    cd libresonic && \ 
    mvn package

RUN cd libresonic && mvn -P full -pl subsonic-booter -am install

RUN cd libresonic && mvn -P full -pl subsonic-installer-debian -am install
    
RUN cd libresonic && dpkg -i ./subsonic-installer-debian/target/subsonic-*.deb

RUN useradd --home /var/subsonic -M subsonic -K UID_MIN=10000 -K GID_MIN=10000 && \
    mkdir -p /var/subsonic && chown subsonic /var/subsonic && chmod 0770 /var/subsonic

COPY start.sh /start.sh

RUN chmod +x /start.sh

USER subsonic

CMD ["./start.sh"]
