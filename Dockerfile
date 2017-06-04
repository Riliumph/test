FROM ubuntu:14.04
MAINTAINER tester

##### Avoidance method of apt-get error
### Disable interactive interface for installer
ENV DEBIAN_FRONTEND noninteractive
### Force initctl true
RUN dpkg-divert --local --rename --add /sbin/initctl && rm -f /sbin/initctl && ln -s /bin/true /sbin/initctl
### Add architecture for 32bit software(ex:i386)
RUN dpkg --add-architecture i386
### Speed up by changing the apt-get reference destination
RUN sed -i.us -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp/g'  /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y vim-gnome

# USER追加
RUN useradd -m tester \
 && gpasswd -a tester sudo \
 && echo "tester:tester" | chpasswd \
 && sed -i.bak -e 's/home\/tester:/home\/tester:\/bin\/bash/' /etc/passwd

ENV HOME /home/tester
WORKDIR ${HOME}
COPY ./bash_aliases ${HOME}/.bash_aliases
RUN chown tester:tester -R $HOME

# USER設定
USER tester


