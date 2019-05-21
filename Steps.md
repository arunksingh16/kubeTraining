>[Login in Katacoda platform and go to kubernetes playground]
>https://www.katacoda.com/courses/kubernetes/playground
>Yaml File creation 
>https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment/



1. Initialise the Kubernetes cluster over there
2. kubectl get nodes (Will list all the running nodes over there)
3. kubectl config view 
4. kubectl describe nodes (verbose output for environment)
5. kubectl get namespace (listing all the namespaces at once)
6. kubectl get pods  -n kube-system
7. kubectl get pods --all-namespaces
8. kubectl cluster-info
9. kubectl get secret -o yaml


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
> Create rs.yaml
- kubectl create -f rs.yaml
- kubectl get pods -o wide
- kubectl get pods --show-labels



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





