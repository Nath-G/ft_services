# *ft_services*
42 Project - Cursus 2019 - 2020

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
