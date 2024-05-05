# create pod with image nginx
k run nginx --image nginx

# edit pods directly
k edit pod <pod-name>

# get resources details (e.g. apiVersion) for resource
k api-resources | grep replicaset

# get details about resource
k explain replicaset

# get files inside the container

kubectl -n elastic-stack exec -it app -- cat /log/app.log

# get logs for a pod

k logs <pod> --all-containers=true

# create all resources in the file 

 k create -f .

 # get the resource consumption for nodes or pods. 

 k top node/pods

 # get pods with certain label

k get pod --selector env=prod,bu=finance,tier=frontend

# get Ingress Resource deployed

k get ingress --all-namespaces

# check default backend for ingress - go check ingress controller

kubectl get deploy ingress-nginx-controller -n ingress-nginx -o yaml