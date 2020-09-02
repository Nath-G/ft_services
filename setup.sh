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

SSH_USERNAME=adminssh
SSH_PASSWORD=adminssh
FTPS_USERNAME=adminftps
FTPS_PASSWORD=adminftps
DB_USER=mysql
DB_PASSWORD=password
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
# sleep 60
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

WP_IP=`kubectl get services | awk '/wordpress/ {print $4}'`
PMA_IP=`kubectl get services | awk '/pma/ {print $4}'`
echo "..................WP_IP = $WP_IP..............."
echo "..................PMA_IP = $PMA_IP..............."
cp $srcs/containers/nginx/srcs/index_model.html	$srcs/containers/nginx/srcs/index.html
sed -i "s/__MINIKUBE_IP__/$MINIKUBE_IP/g"		$srcs/containers/nginx/srcs/index.html
# sed -i "s/__WP_IP__/$WP_IP/g"	            	$srcs/containers/nginx/srcs/index.html
# sed -i "s/__PMA_IP__/$PMA_IP/g"		            $srcs/containers/nginx/srcs/index.html
 sed -i "s/__SSH_USERNAME__/$SSH_USERNAME/g"	$srcs/containers/nginx/srcs/install.sh
 sed -i "s/__SSH_PASSWORD__/$SSH_PASSWORD/g"	$srcs/containers/nginx/srcs/install.sh

docker build -t nginx-image $srcs/containers/nginx
docker build -t mysql-image $srcs/containers/mysql
docker build -t wordpress-image $srcs/containers/wordpress
docker build -t phpmyadmin-image $srcs/containers/phpmyadmin
sleep 60
kubectl apply -f srcs/yaml/nginx.yaml
kubectl get all
rm -f ~/.ssh/known_hosts


# sleep 60
kubectl apply -f srcs/yaml/mysql.yaml
kubectl apply -f srcs/yaml/wordpress.yaml
kubectl apply -f srcs/yaml/phpmyadmin.yaml
sleep 60
kubectl get all

# WP_IP=`kubectl get services | awk '/wordpress/ {print $4}'`
# PMA_IP=`kubectl get services | awk '/pma/ {print $4}'`
# echo "..................WP_IP = $WP_IP..............."
# echo "..................PMA_IP = $PMA_IP..............."
# cp $srcs/containers/nginx/srcs/index_model.html	$srcs/containers/nginx/srcs/index.html
# sed -i "s/__MINIKUBE_IP__/$MINIKUBE_IP/g"		$srcs/containers/nginx/srcs/index.html
# sed -i "s/__WP_IP__/$WP_IP/g"	            	$srcs/containers/nginx/srcs/index.html
# sed -i "s/__PMA_IP__/$PMA_IP/g"		            $srcs/containers/nginx/srcs/index.html
#  sed -i "s/__SSH_USERNAME__/$SSH_USERNAME/g"	$srcs/containers/nginx/srcs/install.sh
#  sed -i "s/__SSH_PASSWORD__/$SSH_PASSWORD/g"	$srcs/containers/nginx/srcs/install.sh

# docker build -t nginx-image $srcs/containers/nginx

# sleep 20
# kubectl apply -f srcs/yaml/nginx.yaml
# kubectl get all
# rm -f ~/.ssh/known_hosts

# kubectl exec -it nom du pod -- /bin/sh
# docker run --name myadmin -d --link mysql_db_server:db -p 8080:80 phpmyadmin/phpmyadmin