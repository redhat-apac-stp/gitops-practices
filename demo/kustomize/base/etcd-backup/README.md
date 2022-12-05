# ETCD Automated Backup

ETCD backup will be created by a cronjob which will be using the OpenShift client image to create the backup and debug pods.

In CronJob, the backup will be created in /home/core/backup. If this directory does not exist, it will be created automatically.

The CronJob will also delete the backups older than 1 minute, avoiding unnecessary use of disk resources of Master Nodes.

Here is the list of files involved in configuring the automation

- **namespace.yaml**
> Specific namespace created for running ETCD backup pods.
- **service-account.yaml**
> Service account is created in the namespace dedicated to backup ETCD. This service account will be responsible for performing backup commands for the master nodes
- **cluster-role.yaml**
> As a security measure, the service account created earlier can not have excessive permissions on the cluster, so a Cluster Role is created with specific permissions for running the backup
- **cluster-rolebinding.yaml**
> Clusterrolebinding is created to create the link between the service account and cluster role.
- **scc-role.yaml**
>Role with special privileges to the service account running the directory creation commands and backup execution of ETCD (The aforementioned commands are executed with sudo, and hence the service account need to have special privileges)
- **scc-rolebinding.yaml**
> Clusterrolebinding is created to create the link between the service account and special privileged role.
- **cronjob.yaml**
> cronjob which will be using openshift client image to create the backup and debug pods.
- **kustomization.yaml**
> Kustomization yaml with the references of all the other yamls for etcd-backup automation configuration.
