# KubeContext

## help

`kubectl config -h`

## get current context

`kubectl config current-context`

## set context (not switch)

`kubectl config set-context <context-name>`

## switch context:

`kubectl config use-context <context-name>`

## use context from file

`kubectl config --kubeconfig=/path/<config-file-name> use-context <context-name>`

## Set the config file as the default kubeconfig

# RBAC

## get roles & role binding

`kubectl get roles`

`kubectl get rolebindings`

## check access

check if I can create deployment

`kubectl auth can-i create deployment`

## check access as other user (impersonating) (in a namespace)

`kubectl auth can-i create deployment --as <user-name> -n <namespace>`

# Role

create role

`kubectl create role pod-reader --verb=get --verb=list --verb=watch --resource=pods`

create rolebinding (need role/clusterRole and user/serviceAccount)

`k create rolebinding dev-user-binding --role=developer --user=dev-user`

# Admission controller

## check admission controlle

`kube-apiserver -h | grep enable-admission-plugins`

`kubectl exec -it kube-apiserver-controlplane -n kube-system -- kube-apiserver -h | grep 'enable-admission-plugins'`

Since the `kube-apiserver` is running as pod you can check the process to see enabled and disabled plugins.

`ps -ef | grep kube-apiserver | grep admission-plugins`
