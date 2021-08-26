FROM maven:3.8.1-adoptopenjdk-8
ADD . /app
WORKDIR /app
RUN apt-get update \
    && apt-get install -y zip wget unzip sudo \
    && apt-get install -y python3-pip \
    && pip3 install awscli \
    && aws --version \
	&& wget https://releases.hashicorp.com/terraform/0.13.7/terraform_0.13.7_linux_amd64.zip \
    && unzip terraform_0.13.7_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_0.13.7_linux_amd64.zip \
    && terraform version
