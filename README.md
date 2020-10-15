# *ft_services*
42 Project - Cursus 2019 - 2020

* https://kubernetes.io/fr/docs/concepts/services-networking/service/
* https://www.objectif-libre.com/fr/blog/2018/01/08/kubernetes-et-les-ips-externes-services-et-metallb/
* https://blog.inkubate.io/install-and-configure-metallb-as-a-load-balancer-for-kubernetes/
* https://wiki.alpinelinux.org/wiki/FTP
* https://ensiwiki.ensimag.fr/images/c/c4/TP3.pdf
* https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/
* https://kubernetes.io/fr/docs/concepts/configuration/secret/

# *Tutos*
* metallb:
** https://metallb.universe.tf/installation/
* https://cloud.google.com/solutions/best-practices-for-building-containers?hl=fr
* https://hub.docker.com/r/phpmyadmin/phpmyadmin/
* https://www.tech2tech.fr/grafana-superviser-tous-vos-serveurs-et-peripheriques/

# *Github*
* https://github.com/42f/ft_services
* https://github.com/pde-bakk/ft_services
* https://github.com/nesvoboda/ft_services
*

# *Commandes*
* entrer dans le contenairer d'un pod : kubectl exec -it <nom du pod ex : phpmyadmin-deployment-6d6f76c9f-ljnfr> -- bin/sh
* récupérer l IP d'un service dans un script : # PMA_IP=`kubectl get services | awk '/pma/ {print $4}'`
= kubectl get services | awk '/NOM_DU_SERVICE/ {print $4}'
* kubectl describe pod wordpress
* se connecter à wp : http://172.17.0.22:5050/wp-login.php

# *ftp access*
sudo apt update
sudo apt install filezilla
adminftps
open filezilla (client)
insert user : ftps_admin
mp : ftps_admin
port: 21
click on connect
create a repository test on the serveur 172.17.0.62
take the readme in the local repository then sent it on the test repository
thanks to kubectl exec -it <nom du pod ex : ftps-6d6f76c9f> -- bin/sh go to the ftps pod
then check that the file is in var/ftp/ repository
