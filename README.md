# *ft_services*
42 Project - Cursus 2019 - 2020

# *How to run the project*
For this project, the VM (OS Linux Ubuntu 18.04) has to have following settings : 
- processor : 2 
- RAM : 3072MB

The script has to be launched with a user in docker group.
So you have to :
- 1- execute the script in order to add current user to the script (password is required), 
- 2- then stop and re-start the VM (with the good settings)
- 3- and execute a 2nd time the setup.
- Command to execute the script :
./setup.sh
- When all the processes run, you can go to 172.17.0.2 thanks to the web explorer, some advices are displayed.

# *For further*
* Environment variable for wp and phpmyadmin : 
- https://medium.com/@tomahock/passing-system-environment-variables-to-php-fpm-when-using-nginx-a70045370fad

# *Documentation*
* https://kubernetes.io/fr/docs/concepts/services-networking/service/
* https://kubernetes.io/fr/docs/concepts/workloads/pods/
* https://kubernetes.io/fr/docs/tasks/access-application-cluster/web-ui-dashboard/
* https://github.com/kubernetes/dashboard
* https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard
* https://www.objectif-libre.com/fr/blog/2018/01/08/kubernetes-et-les-ips-externes-services-et-metallb/
* https://blog.inkubate.io/install-and-configure-metallb-as-a-load-balancer-for-kubernetes/
* https://wiki.alpinelinux.org/wiki/FTP
* https://ensiwiki.ensimag.fr/images/c/c4/TP3.pdf
* https://kubernetes.io/docs/tasks/inject-data-application/distribute-credentials-secure/
* https://kubernetes.io/fr/docs/concepts/configuration/secret/
* https://docs.influxdata.com/influxdb/v1.8/tools/influx-cli/
* https://kubernetes.io/fr/docs/reference/kubectl/kubectl/
* https://metallb.universe.tf/installation/
* https://cloud.google.com/solutions/best-practices-for-building-containers?hl=fr
* https://hub.docker.com/r/phpmyadmin/phpmyadmin/
* https://www.tech2tech.fr/grafana-superviser-tous-vos-serveurs-et-peripheriques/
* https://grafana.com/docs/grafana/latest/datasources/influxdb/

# *Commandes*
* Go to a pod container : kubectl exec -it <nom du pod ex : phpmyadmin-deployment-6d6f76c9f-ljnfr> -- bin/sh
* Recover a service IP in a script : # PMA_IP=`kubectl get services | awk '/pma/ {print $4}'`
= kubectl get services | awk '/NOM_DU_SERVICE/ {print $4}'
* kubectl describe pod wordpress
* kubectl cp <pod_name>:<source_file_path> -c <container_name> -n <namespace_name> <target_local_file_path> (à la racine de ft_services : pas depuis le pod)
* kubectl cp influxdb-74f548446f-226t9:/etc/telegraf.conf -c influxdb -n default ~/Bureau/telegraf.conf
ou kubectl cp influxdb-74f548446f-226t9:/etc/telegraf.conf ~/Bureau/telegraf.conf

