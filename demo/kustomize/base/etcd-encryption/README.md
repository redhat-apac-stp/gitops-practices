# ETCD Encryption

When you enable etcd encryption, the following OpenShift API server and Kubernetes API server resources are encrypted:

- Secrets
- Config maps
- Routes
- OAuth access tokens
- OAuth authorize tokens

When you enable etcd encryption, encryption keys are created. These keys are rotated on a weekly basis. You must have these keys to restore from an etcd backup. 

Following files are used to configure this:
- **apiserver.yaml**
> Setting the encryption field type to aescbc which means that AES-CBC with PKCS#7 padding and a 32 byte key is used to perform the encryption
- **kustomization.yaml**
> Kustomization yaml with the references of all the other yamls for etcd-backup automation configuration.

Encryption process can take 20 minutes or longer for this process to complete, depending on the size of the cluster.
To verify the etcd encryption was successful:

- Review the Encrypted status condition for the OpenShift API server to verify that its resources were successfully encrypted:
```
$ oc get openshiftapiserver -o=jsonpath='{range .items[0].status.conditions[?(@.type=="Encrypted")]}{.reason}{"\n"}{.message}{"\n"}'
```
The output shows EncryptionCompleted upon successful encryption:
```
EncryptionCompleted
All resources encrypted: routes.route.openshift.io
```
If the output shows EncryptionInProgress, encryption is still in progress. Wait a few minutes and try again.

- Review the Encrypted status condition for the Kubernetes API server to verify that its resources were successfully encrypted:
```
$ oc get kubeapiserver -o=jsonpath='{range .items[0].status.conditions[?(@.type=="Encrypted")]}{.reason}{"\n"}{.message}{"\n"}'
```
The output shows EncryptionCompleted upon successful encryption:
```
EncryptionCompleted
All resources encrypted: secrets, configmaps
```
If the output shows EncryptionInProgress, encryption is still in progress. Wait a few minutes and try again.

Ref: https://docs.openshift.com/container-platform/4.9/security/encrypting-etcd.html