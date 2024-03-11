# Create resources

kubectl create -f foo.yaml (--record)

## create pod with image only

kubectl run redis --image redis --replicas=4

kubectl run nginx --image=nginx --dry-run=client -o yaml > nginx-deployment.yaml # generate yaml file but not create the pod

kubectl run hazelcast --image=hazelcast --port=5701 (Start a single instance of hazelcast and let the container expose port 5701 . )

## create service

kubectl expose pod redis --port=6379 --name redis-service (This will automatically use the pod's labels as selectors)

kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml (it will assume selectors as app=redis)

kubectl expose pod nginx --port=80 --name nginx-service --type=NodePort (Create a Service named nginx of type NodePort to expose pod nginx's port 80 on port 30080 on the nodes)

kubectl expose pod nginx --port=80 --target-port=8000 Create a service for a pod nginx, which serves on port 80 and connects to the containers on port 8000.

## create a deployment

kubectl create deployment --image=nginx nginx (--dry-run -o yaml)

# Update pod

## update resources

kubectl appply -f foo.yml

## update pod without definition yaml

```
kubectl get pod <pod-name> -o yaml > pod-definition.yaml
```

Then edit the file to make the necessary changes, delete, and re-create the pod.

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

# get the node on which a pod is running

kubectl get pods -o wide

# get all resources

kubectl get all

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
