FROM ubuntu:20.04

# install awscli
RUN apt-get update && apt-get install -y \
    software-properties-common
    
RUN add-apt-repository universe
RUN apt-get update && apt-get install -y \
    python3.4 \
    python3-pip

RUN pip install awscli

# COPY aws credentials
RUN mkdir -p /root/.aws
COPY credentials /root/.aws/credentials

# install curl
RUN apt-get update && apt-get install -y \
    curl

# install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# COPY KUBECONFIG
COPY config /root/.kube/config

# install vaultcli
RUN \
	apt update && apt install -y wget unzip \
	&& wget https://releases.hashicorp.com/vault/1.6.2/vault_1.6.2_linux_amd64.zip \
	&& unzip vault_1.6.2_linux_amd64.zip && mv vault /usr/local/bin/ \  
    && rm vault_1.6.2_linux_amd64.zip

# install mysql
RUN apt-get update && apt-get install -y \
    mysql-client

CMD ["/bin/bash"]