# create service by exposing deployment endpoint

`kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080`

# create ingress

`k create ingress <ingress-name> --rule="host/path=service:port"`
