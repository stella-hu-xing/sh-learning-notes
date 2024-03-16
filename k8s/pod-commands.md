## select pods based on labels

`k get pods --selector <key>=<value>`

# Deployment

## To edit deployment

`kubectl edit deployment <deployment-name>`

## To see the Deployment rollout status,

`kubectl rollout status deployment/nginx-deployment`

## To check the revisions of this Deployment

`kubectl rollout history deployment/nginx-deployment`

## To update deployment via file

`kubectl apply -f <deployment>.yaml`

## To update deployment via set container image directly

`kubectl set image deployment <deployment-name> <container1>=<image-name> <container2>=<image-name>`

## To undo the current rollout and rollback to the previous revision

`kubectl rollout undo deployment/<deployment-name>`

### Using the --revision flag

`kubectl rollout history deployment nginx --revision=1`

### Using the --record flag

use the --record flag to save the command used to create/update a deployment against the revision number.

## To scale/change replica number of a deployment

`k scale deployment <deployment-name> --replicas=3`

# Job

## create job

`kubectl create job my-job --image=busybox`

## Create a job from a cron job named "a-cronjob"

kubectl create job test-job --from=cronjob/a-cronjob

## Create a cron job

`kubectl create cronjob my-job --image=busybox --schedule="_/1 _ \* \* \*"`
