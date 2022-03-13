#!/bin/bash
# Originally authered by Joaquin Fernandez <joaquin.fernandez@linux.com>

oc apply -f openshift-gitops-operator-sub.yaml
oc wait --for=condition=established --timeout=120s crd/argocds.argoproj.io
oc wait --for=condition=established --timeout=30s crd/applications.argoproj.io
oc wait --for=condition=established --timeout=30s crd/applicationsets.argoproj.io
oc wait --for=condition=established --timeout=30s crd/appprojects.argoproj.io
oc apply -f openshift-gitops-instance.yaml
