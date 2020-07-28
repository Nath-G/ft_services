# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_vm.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <nagresel@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/26 17:39:47 by user42            #+#    #+#              #
#    Updated: 2020/05/27 15:00:04 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh


SSH_USERNAME=adminssh
SSH_PASSWORD=adminsshpw
FTPS_USERNAME=adminftps
FTPS_PASSWORD=adminftps
DB_USER=mysql
DB_PASSWORD=pass
WP_USER=wpuser
WP_PASSWORD=wppassword

srcs=./srcs

 docker ps > /dev/null;
    if [ $? = 1 ]
    then
        printf "\e[31m\n\n --- ERROR! It seems that docker doesn't work properly.
        This may be the case if you're using 42's VM.
        We will attempt to fix it. In order for it to start working, you\n
        will have to log out and login again. ---\e[0m\n\n\n";
        sudo usermod -aG docker $(whoami);
        printf "\e[94m\n\n --- The fix is applied. The VM has to be log out and log in again. ---\e[0m\n\n\n";
        exit 1;
    else
        printf "\e[94m\n\n --- Docker works fine.  ---\e[0m\n\n\n";
    fi

printf "\e[94m\n\n --- Starting Minikube ---\e[0m\n\n\n";
	minikube start --cpus=2 --memory 4096 --vm-driver=docker 
    minikube addons enable metallb 
 	minikube addons enable metrics-server
    minikube addons enable default-storageclass
    minikube addons enable storage-provisioner
	minikube addons enable dashboard

minikube ip > /tmp/.minikube.ip

MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
echo ".........minikube ip = $MINIKUBE_IP..........."

# #model set-up

# echo 'fin commande copie'

eval $(minikube -p minikube docker-env)

#get images in minikube
 echo ".....................Building nginx new image...."
# ----1st try
# kubectl apply -f srcs/yaml/metallb.yaml
sleep 60
# sleep 30

#check that metallb is running

# kubectl get pods -n metallb-system
#Configure MetalLB
# kubectl apply -f srcs/yaml/metallb-config.yaml
# ----
# 2nd try
kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl diff -f - -n kube-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/yaml/metallb-config.yaml
docker build -t nginx-image $srcs/containers/nginx

 sleep 20
kubectl apply -f srcs/yaml/nginx.yaml

# sleep 60

kubectl get all

#kubectl get services | awk '/wordpress/ {print $4}'
#MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
