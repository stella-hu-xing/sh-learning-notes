# Create resources

kubectl create -f foo.yaml (--record)

# update resources

kubectl appply -f foo.yml

# get resources

kubectl get pod foo-pod

# get all resources

kubectl get all

## ReplicaSet

# delete replicaset

kubectl delete replicaset myapp-replicaset # also delete underlying pods

# edit replicaset (not update the file)

kubectl edit replicaset myapp-replicaset

# replace replicaset (not update the file)

kubectl replace -f myapp-replicaset.yml

# scale replicaset (not update the file)

kubectl scale replicaset myapp-replicaset.yml --replicas=2

# if manually create pods out side of replicaset, the newly created one will be terminated.

## Deployment

# A Deployment provides declarative updates for Pods and ReplicaSets.

#

# You describe a desired state in a Deployment, and the Deployment Controller changes the actual state

# to the desired state at a controlled rate. You can define Deployments to create new ReplicaSets, or

# to remove existing Deployments and adopt all their resources with new Deployments.

# Note: Do not manage ReplicaSets owned by a Deployment.

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

## CKAD

Keep the code - 20KLOUD handy while registering for the CKA or CKAD exams at Linux Foundation to get a 20% discount.
