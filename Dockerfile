#
# Docker file for libresonic
# 
# https://github.com/tonipes/libresonic-docker
#
# https://github.com/Libresonic/libresonic
#

FROM tomcat:6.0

MAINTAINER Toni Pesola

RUN wget https://libresonic.org/release/libresonic-stable.war

RUN rm -rf /usr/local/tomcat/webapps && mkdir /usr/local/tomcat/webapps

RUN cp libresonic-stable.war /usr/local/tomcat/webapps/ROOT.war
