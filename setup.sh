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

#!/bin/bash

SSH_USERNAME=adminssh
SSH_PASSWORD=adminssh
FTPS_USERNAME=ftps_admin
FTPS_PASSWORD=ftps_admin
DB_USER=mysql
DB_PASSWORD=password
WP_USER=wp_admin
WP_PASSWORD=wp_admin

srcs=./srcs

 docker ps > /dev/null;
    if [ $? = 1 ]
    then
        printf "\e[31m\n\n --- ERROR! It seems that docker doesn't work properly.
        This may be the case if you're using 42's VM.
        We will attempt to fix it. In order for it to start working, you\n
        will have to log out and login again. ---\e[0m\n\n\n";
        sudo usermod -aG docker $(whoami);
        printf "\e[0;35m\n\n --- The fix is applied. The VM has to be log out and log in again. ---\e[0m\n\n\n";
        exit 1;
    else
        printf "\e[0;35m\n\n --- Docker works fine.  ---\e[0m\n\n\n";
    fi

printf "\e[1;35m\n\n --- Starting Minikube ---\e[0m\n\n\n";

minikube start --cpus=2 --memory 3072 --vm-driver=docker 
minikube addons enable metrics-server
minikube addons enable default-storageclass
minikube addons enable storage-provisioner
minikube addons enable dashboard

minikube ip > /tmp/.minikube.ip

MINIKUBE_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"

printf "\e[94m\n\n --- minikube ip = $MINIKUBE_IP  ---\e[0m\n\n\n";
eval $(minikube -p minikube docker-env)

printf "\e[1;35m\n\n ---         Building images         ---\e[0m\n\n\n";

kubectl get configmap kube-proxy -n kube-system -o yaml | sed -e "s/strictARP: false/strictARP: true/" | kubectl diff -f - -n kube-system
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/metallb-config.yaml

cp $srcs/containers/nginx/srcs/index_model.html	$srcs/containers/nginx/srcs/index.html

sed -i "s/__SSH_USERNAME__/$SSH_USERNAME/g"		$srcs/containers/nginx/srcs/index.html
sed -i "s/__SSH_PASSWORD__/$SSH_PASSWORD/g"		$srcs/containers/nginx/srcs/index.html
sed -i "s/__FTPS_USERNAME__/$FTPS_USERNAME/g"	$srcs/containers/nginx/srcs/index.html
sed -i "s/__FTPS_PASSWORD__/$FTPS_PASSWORD/g"	$srcs/containers/nginx/srcs/index.html
sed -i "s/__WP_USER__/$WP_USER/g"	           	$srcs/containers/nginx/srcs/index.html
sed -i "s/__WP_PASSWORD__/$WP_PASSWORD/g"       $srcs/containers/nginx/srcs/index.html
sed -i "s/__SSH_USERNAME__/$SSH_USERNAME/g"		$srcs/containers/nginx/srcs/install.sh
sed -i "s/__SSH_PASSWORD__/$SSH_PASSWORD/g"		$srcs/containers/nginx/srcs/install.sh

docker build -t nginx-image $srcs/containers/nginx
docker build -t mysql-image $srcs/containers/mysql
docker build -t wordpress-image $srcs/containers/wordpress
docker build -t phpmyadmin-image $srcs/containers/phpmyadmin
docker build -t ftps-image $srcs/containers/ftps
docker build -t influxdb-image $srcs/containers/influxdb
docker build -t grafana-image $srcs/containers/grafana

rm -f ~/.ssh/known_hosts

printf "\e[1;35m\n\n ---          launch services          ---\e[0m\n\n\n";

names="nginx ftps mysql wordpress phpmyadmin influxdb grafana"


up (){
	    kubectl get pods --ignore-not-found --field-selector status.phase=Running | grep -i $name | grep Running
}

launch () {
	kubectl apply -f srcs/yaml/$1.yaml 
	printf "\e[94m\nCreating resources for $1${RESET}\e[0m";
	c=0
	until up $1
	do	
			printf "\e[94m.${RESET}\e[0m";
					sleep 0.4
			c=$((c+1))
			if [ $c -gt 75 ];
			then
				printf "\e[0;33m\n!! Timeout for $1 !!\e[0m";
				break
			fi
	done
	printf "\n";
}

for name in $names
do
launch $name
done

kubectl get all

printf "\e[0;92m\nYou can try to launch the minikube dashboard with the following commande:\n\e[0m";
printf "\e[94m\nminikube dashboard\n\e[0m";
