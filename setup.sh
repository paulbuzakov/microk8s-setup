#!/bin/bash
sudo apt update
sudo apt upgrade

sudo apt install snapd -y
snap version

sudo span install microk8s --classic --channel=1.25
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
su - $USER
microk8s status --wait-ready
alias kubectl ='microk8s kubectl'
kubectl cluster-info

microk8s enable dns ingress prometheus cert-manager hostpath-storage
microk8s kubectl get all --all-namespaces
microk8s kubectl get nodes
