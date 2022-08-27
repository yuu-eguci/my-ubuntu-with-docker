FROM ubuntu:latest

WORKDIR /

RUN apt update
# lsb-release は ubuntu のバージョンを簡単に見るツールです。
RUN apt install -y lsb-release
# デフォルトで sudo は入っていなかったので。
RUN apt install -y sudo

# 以下、 docker の公式ドキュメントから。 (-y はこちらで追加しているが)
# https://docs.docker.com/engine/install/ubuntu/
# NOTE: apt-get install より apt install のほうがよいという話もあるが、
#       docker の公式ドキュメントで apt-get が使われているので。
# Update the apt package index and install packages to allow apt to use a repository over HTTPS.
# NOTE: Receiving a GPG error when running apt-get update? という項目が公式にある。
#       もし出くわしたら参照すること。
RUN sudo apt-get update
# NOTE: exit 0 だけ追加した。こんなん↓発生するから。
#       E: Unable to locate package docker-engine
RUN sudo apt-get remove docker docker-engine docker.io containerd runc ; exit 0
# Add Docker’s official GPG key.
RUN sudo apt-get install -y \
    ca-certificates curl gnupg lsb-release
RUN sudo mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Use the following command to set up the repository.
RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update the apt package index, and install the latest version of Docker Engine, containerd,
# and Docker Compose, or go to the next step to install a specific version.
RUN sudo apt-get update
RUN sudo apt-get install -y \
    docker-ce docker-ce-cli containerd.io docker-compose-plugin
# Verify that Docker Engine is installed correctly by running the hello-world image.
# NOTE: これは単純な Docker-in-Docker 環境では機能しない。
# RUN sudo docker run hello-world
