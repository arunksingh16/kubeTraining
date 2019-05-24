> [Login in Katacoda platform and go to kubernetes playground]
> https://www.katacoda.com/courses/kubernetes/playground
> Yaml File creation 
> https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment/



1. Initialise the Kubernetes cluster over there
2. kubectl get nodes (Will list all the running nodes over there)
3. kubectl config view 
4. kubectl describe nodes (verbose output for environment)
5. kubectl get namespace (listing all the namespaces at once)
6. kubectl get pods  -n kube-system
7. kubectl get pods --all-namespaces
8. kubectl cluster-info
9. kubectl get secret -o yaml
10. kubectl get pods -o wide --show-labels --all-namespaces
11. kubectl delete pods <name>
12. kubectl get endpoints

> An object definition in Kubernetes requires an apiVersion field. When Kubernetes has a release that updates what is available for you to use—changes something in its API—a new apiVersion is created.
> [https://matthewpalmer.net/kubernetes-app-developer/articles/kubernetes-apiversion-definition-guide.html]


- cc [show all existing resources]


Lets do the deployment 
==============================

> Create file for deployment
- kubectl get deployments
- kubectl create -f deployment.yaml

> It will create 2 pods
- kubectl get pods

> More details on deployment 
- kubectl describe deployment name-webserver
- kubectl describe pod <pod_name>

> Scaling the deployment
- kubectl scale deployment/name-webserver --replicas=4
- kubectl get deployment name-webserver -o yaml

> Rollout the changes
- kubectl get rs
- kubectl rollout history deployment/name-webserver
- kubectl set image deployment/name-webserver webserver=nginx:1.10 --all
- kubectl rollout undo deployment/name-webserver

> Updating the deployment
- kubectl apply -f deployment.yaml

> Deleting the deployment
- kubectl delete deployment
- kubectl delete -f deployment.yaml

> If you want to use your local image for deployment then You can point your docker client to the VM's docker daemon by running, in case of minikube
- eval $(minikube docker-env)

> Then you can build your image normally and create your kubernetes resources normally using kubectl. Make sure that you have
- imagePullPolicy: IfNotPresent



Creating Service
==============================

> There are multiple ways you can access a service inside a pod.
-Cluster IP
-Target Port
-NodePort
-Load Balancer

> While TargetPort and ClusterIP make it available to inside the cluster,the NodePort exposes the service on each Node’s IP via the defined static port. No matter which Node within the cluster is accessed, the service will be reachable based on the port number defined.
https://www.katacoda.com/courses/kubernetes/networking-introduction


> Create a yaml for service
- kubectl get services
- kubectl create -f service.yaml
- kubectl describe svc_name

> Test the same with curl command

> on worker node go and check 



Working on Replica Sets
==============================
[Ref https://www.mirantis.com/blog/kubernetes-replication-controller-replica-set-and-deployments-understanding-replication-options/]

> Create rs.yaml
- kubectl create -f rs.yaml
- kubectl get pods -o wide
- kubectl get pods --show-labels
- kubectl get pods -o wide --show-labels --all-namespaces




Working on labels
==============================
> Create label.yaml
- kubernetes create -f label.yaml
- kubectl get pods -o wide
- kubectl get pods --show-labels

## Let us add another label to the above pod
- kubectl label pod pod-example tier=backend
## Labels can be overwritten or delete
- kubectl label --overwrite pods pod-example env=prod


Selection Via Labels(Label Selector)
=====================================
1. Equality Based Requirement

> Create one more pod with diff name
- kubectl get pods --show-labels
- kubectl label pod pod-example-2 tier=frontend

> NAME            READY     STATUS    RESTARTS   AGE       LABELS
> pod-example     1/1       Running   0          9m        env=dev,name=lbl-pod,tier=backend
> pod-example-2   1/1       Running   0          1m        env=dev,name=lbl-pod,tier=frontend

- kubectl get pods  -l env=dev
- kubectl get pods  -l tier=frontend
- kubectl get pods  -l env!=prod
- kubectl get pods  -l env!=prod,tier=backend
## In above commands, labels separated by comma is a kind of AND satisfy operation.


2. Set Based Requirement (The supported operators here are in , notin and exists .)

- kubectl get pod -l 'env in (dev)'
- kubectl get pod -l 'env in (dev,tier in (frontend)'
- kubectl get pods -l 'env notin (dev)'

## We can also select kubernetes resources via field selector but it has very limited support as of now. Field selector do not support set based requirement. Even the support for equality based requirement is not that extensible.

- kubectl get pod --field-selector metadata.name=pod-example

[Ref: https://medium.com/mayadata/kubernetes-label-selector-and-field-selector-81d6967bb2f]



Working on Secrets
==============================

- echo -n 'admin' > ./username.txt
- echo -n '1f2d1e2e67df' > ./password.txt
- kubectl create secret generic db-user-pass --from-file=./username.txt --from-file=./password.txt
- kubectl get secrets
- kubectl describe secrets/db-user-pass


> Creating a secret
- kubectl create -f secret.yaml
- kubectl get secrets




> kubectl logs -f <pod-name>




Creating a quick demo
==============================

1. Create a index.js

const os = require('os');
const http = require('http');

const requestHandler = (req, res) => {
    console.log('Request incoming from ' + req.connection.remoteAddress);
    res.writeHead(200);
    res.end('Success! You\'ve hit ' + os.hostname() + ' on ' + os.platform() + '!');
};

const server = http.createServer(requestHandler)

server.listen(3000);


2. Create Dockerfile

FROM node:lts
ADD index.js /index.js
CMD node index.js

3. Build the image

docker build -t node-js-http .

4. Tag the image

docker tag node-js-http arun161087/node-js-http

5. docker login

6. Push the image in repository

    docker push arun161087/node-js-http

7. docker run --name run-node-js -p 3000:3000 -d arun161087/node-js-http

8. Curl it now 

    http://localhost:3000

9. kubectl run run-node-js --image=arun161087/node-js-http --port=3000 --generator=run/v1

10. kubectl get pods -w

11. kubectl expose rc run-node-js --type=LoadBalancer --name run-node-js

12. kubectl expose rc run-node-js --type=NodePort --name run-node-js-np

13. kubectl get services

14. kubectl scale rc run-node-js --replicas=10

15. 
