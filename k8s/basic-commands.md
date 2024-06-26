# Create resources

kubectl create -f foo.yaml (--record)

k create -f . (create all resources in current folder)

## create pod with image only

kubectl run redis --image redis --replicas=4

kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml # generate yaml file but not create the pod

kubectl run hazelcast --image=hazelcast --port=5701 (Start a single instance of hazelcast and let the container expose port 5701 . )

## create service

kubectl expose pod redis --port=6379 --name redis-service (This will automatically use the pod's labels as selectors)

kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml (it will assume selectors as app=redis)

kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort (Create a Service named nginx of type NodePort to expose pod nginx's port 80 on port 30080 on the nodes)

kubectl expose pod nginx --port=80 --target-port=8000 Create a service for a pod nginx, which serves on port 80 and connects to the containers on port 8000.

## expose a service for an Pod via existing service

- need to make sure the selector in service matches the labels in Pod.

## create a deployment

kubectl create deployment --image=nginx nginx --replicas=3 (--dry-run -o yaml)

## create namespace

k create namespace ingress-nginx

## create ingress

`k create ingress <ingress-name> --rule="host/path=service:port"`

## create configmap

`k create config my-config --from-literal=app_key=app_value --from-literal=app_key1=app_value1`

## switch namespace context

`kubectl config set-context --current --namespace=my-namespace`

# Update pod

## update resources

kubectl apply -f foo.yml

## update resouce forcely

kubectl replace -f <pod>.yaml --force

## Formatting Output

kubectl [command] [TYPE] [NAME] -o <output_format>

Here are some of the commonly used formats:

- `-o json` Output a JSON formatted API object.

- `-o name` Print only the resource name and nothing else.

- `-o wide` Output in the plain-text format with any additional information.

- `-o yaml` Output a YAML formatted API object.

## update properties

To modify the properties of the pod, you can utilize the

```
kubectl edit pod <pod-name>
```

Please note that only the properties listed below are editable.

- spec.containers[*].image

- spec.initContainers[*].image

- spec.activeDeadlineSeconds

- spec.tolerations

- spec.terminationGracePeriodSeconds

# get resources

kubectl get pod foo-pod

with labels

k get pods --selector env=prod,bu=finance,tier=frontend

# get the node on which a pod is running

kubectl get pods -o wide

# get all resources

`kubectl get all`

## ReplicaSet

# delete replicaset

Can use the `scale` command to delete all pods in existing replicaset.

kubectl delete replicaset myapp-replicaset # also delete underlying pods

# edit replicaset (not update the file)

kubectl edit replicaset myapp-replicaset

# replace replicaset (not update the file)

kubectl replace -f myapp-replicaset.yml

# scale replicaset (not update the file)

kubectl scale replicaset myapp-replicaset.yml --replicas=2

# if manually create pods out side of replicaset, the newly created one will be terminated.

## Deployment

# rollback a deployment

kubectl rollout undo deployment/my-deployment (--to-revision=2)

# get deployment status

kubectl rollout status deployment/my-deployment

# get deployment history

kubectl rollout history deployment/my-deployment

# set new image to Deployment

kubectl set image deployments/frontend simple-webapp=kodekloud/webapp-color:v2

# update deployment

kubectl edit deployment/nginx-deployment

# Context

## get current context

kubectl config current-context

## switch namespace

kubectl config set-context $(kubectl config current-context) --namespace=prod

## get pods in all ns

kubectl get pods --all-namespaces

## get files in a Pod

kubectl exec <pod_name> -- ls -la

## get pods status and reason

k describe pod elephant | grep -A5 State

_NOTE: Grep, short for “global regular expression print”, is a command used for searching and matching text patterns in files contained in the regular expressions._

## delete the existing resource first and recreate a new one from the YAML file.

kubectl replace -f elephant.yaml --force

## inspect logs in pod

`kubectl logs [-f] [-p] (POD | TYPE/NAME) [-c CONTAINER]`

## output the pod manifest

`kubectl get pod orange -o yaml > /root/orange.yaml.`

## Display resource (CPU/memory) usage of nodes.

`kubectl top node [NAME | -l label]`

`kubectl top pod --sort-by='memory' --no-headers | head -1 ` (sort)

# API server settings

## check the kube-apiserver settings.

1. get pods name ` k get pods --all-namespaces`
2. then find the api server in `kube-system` namespace
3. describe the api server pod

# Switch Context

only switch namespace:
`kubectl config set-context --current --namespace=`

# Get resource counts

`kubectl get clusterroles --no-headers  | wc -l`

`kubectl get clusterroles --no-headers  -o json | jq '.items | length'`
