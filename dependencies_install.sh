#!/usr/bin/env bash
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
echo 'Check kubectl version'
kubectl version --short --client
chmod +x prereqs.sh
sh prereqs.sh
aws --version
eksctl version
mkdir -p /root/.aws/
touch /root/.aws/credentials
touch /root/.aws/config
echo [default] >> /root/.aws/credentials
echo [default] >> /root/.aws/config
echo region = us-east-1 >> /root/.aws/config
echo output = json >> /root/.aws/config
#      - chmod +x create_iam_role.sh
#      - sh create_iam_role.sh
#aws eks update-kubeconfig --name eks-django-app --region us-east-1
