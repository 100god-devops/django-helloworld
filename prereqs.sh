#!/usr/bin/env bash

# This script will install EKS prerequisites on Amazon Linux or Amazon Linux 2
# * eksctl
# * AWS CLI

set -e

#mkdir -p $HOME/bin
#echo 'export PATH=$HOME/bin:$PATH' >>~/.bashrc

# AWS CLI
if ! type aws >/dev/null 2>&1; then
	curl -o awscli-bundle.zip https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
	unzip awscli-bundle.zip
	./awscli-bundle/install -b /usr/bin/aws
	echo 'AWS CLI installed'
else
	echo 'AWS CLI already installed'
fi

# eksctl
if ! type eksctl >/dev/null 2>&1; then
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
	mv /tmp/eksctl /usr/bin
	echo 'eksctl installed'
else
	echo 'eksctl already installed'
fi
# Test if AWS credentials exist
aws sts get-caller-identity
