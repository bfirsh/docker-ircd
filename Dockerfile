FROM ubuntu:12.04
MAINTAINER Ben Firshman "ben@firshman.co.uk"
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d; chmod +x /usr/sbin/policy-rc.d
RUN apt-get install -y ircd-irc2
RUN rm /usr/sbin/policy-rc.d
RUN chown -R irc:irc /etc/ircd

ADD run /usr/local/bin/run

USER irc
EXPOSE 6667
CMD ["/usr/local/bin/run"]

