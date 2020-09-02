# *ft_services*
42 Project - Cursus 2019 - 2020


* https://www.objectif-libre.com/fr/blog/2018/01/08/kubernetes-et-les-ips-externes-services-et-metallb/
* https://blog.inkubate.io/install-and-configure-metallb-as-a-load-balancer-for-kubernetes/

# *Tutos*
* metallb:
** https://metallb.universe.tf/installation/
* https://cloud.google.com/solutions/best-practices-for-building-containers?hl=fr
* https://hub.docker.com/r/phpmyadmin/phpmyadmin/

# *Github*
* https://github.com/42f/ft_services
* https://github.com/pde-bakk/ft_services
* https://github.com/nesvoboda/ft_services
*

# *Commandes*
* entrer dans le contenairer d'un pod : kubectl exec -it <nom du pod ex : phpmyadmin-deployment-6d6f76c9f-ljnfr> -- bin/sh
* récupérer lIP d'un service dans un script : # PMA_IP=`kubectl get services | awk '/pma/ {print $4}'`
= kubectl get services | awk '/NOM_DU_SERVICE/ {print $4}'
* kubectl describe pod wordpress