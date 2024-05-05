# Create a busybox pod (using kubectl command) that runs the command "env". Run it and see the output
kubectl run busybox --image=busybox --command -- env --port=80
# kubectl run nginx --image=nginx -- <arg1> <arg2> ... <argN>
# # Start the nginx pod using a different command and custom arguments.
# kubectl run nginx --image=nginx --command -- <cmd> <arg1> ... <argN>

# Create the YAML for a new ResourceQuota called 'myrq' with hard limits of 1 CPU, 1G memory and 2 pods
k create quota myrq --hard=cpu=1,memory=1G,pods=2 --dry-run=client

# Change pod's image to nginx:1.7.1
kubectl set image pod/nginx nginx=nginx:1.7.1

# Get pod's yaml 
kubectl get po nginx -o yaml # Not describe!

# Get pod logs
kubectl logs nginx -p # -p including previous instance

# if logs exist inside pod
kubectl exec pod -- cat /log/app.log

# Execute a simple shell on the nginx pod
k exec -it nginx -- /bin/sh

