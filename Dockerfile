FROM maven:3.8.1-adoptopenjdk-8
ADD . /app
WORKDIR /app
run apt-get install zip -y
