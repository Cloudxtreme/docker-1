FROM bradrydzewski/base

RUN \
  sudo apt-get update && \
  sudo apt-get install -y python python-dev python-pip python-virtualenv

ADD nodejs.sh /etc/drone.d/

RUN sudo apt-get install -y apparmor  
RUN curl -s https://get.docker.io/ubuntu/ | sudo sh  
ADD wrapdocker /usr/local/bin/wrapdocker  
RUN sudo chmod +x /usr/local/bin/wrapdocker  
