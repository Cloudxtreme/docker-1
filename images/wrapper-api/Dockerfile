FROM bradrydzewski/go:1.3

RUN sudo apt-get install -y apparmor  
RUN curl -s https://get.docker.io/ubuntu/ | sudo sh  
ADD wrapdocker /usr/local/bin/wrapdocker  
RUN sudo chmod +x /usr/local/bin/wrapdocker  
