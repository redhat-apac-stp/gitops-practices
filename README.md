# GitOps Practices

A Repo for placing recommended GitOps Practices as followed and experienced by APAC STP Team. 


# Installing Openshift-GitOps Operator

```
oc apply -f https://raw.githubusercontent.com/redhat-apac-stp/gitops-practices/main/openshift-gitops-operator-sub.yaml
```


# Creating ArgoCD Instance
```
https://raw.githubusercontent.com/redhat-apac-stp/gitops-practices/main/openshift-gitops-argocd-instance.yaml
```

# Automated Install via CLI

```
curl -s https://raw.githubusercontent.com/redhat-apac-stp/gitops-practices/main/init-openshift-gitops.sh | bash
```

# Known Issues

Default installation of Openshift GitOps Operator doesnt allow "openshift-gitops-argocd-application-controller" user to apply cluster scoped artifacts. 

Issue is reported at: 
1. https://access.redhat.com/solutions/6158462

Easy resolution can be: 

```
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller
```

# References:
1. https://openshift.tips/ - A placeholder for most commonly used one-liner openshift commands.  
