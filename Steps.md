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


kubectl get all --all-namespaces [show all existing resources]


Lets do the deployment 
==============================

- Create file for deployment

kubectl get deployments
kubectl create -f deployment.yaml

- It will create 2 pods

kubectl get pods

- More details on deployment 
    kubectl describe deployment name-webserver
    kubectl describe pod <pod_name>

- Updating the deployment
    kubectl apply -f deployment.yaml

- Kubectl delete deployment
    kubectl delete -f deployment.yaml

> If you want to use your local image for deployment then You can point your docker client to the VM's docker daemon by running
    eval $(minikube docker-env)

> Then you can build your image normally and create your kubernetes resources normally using kubectl. Make sure that you have
    imagePullPolicy: IfNotPresent



Creating Service
==============================

> Create a yaml for service
    kubectl get services
    kubectl create -f service.yaml

> Test the same with curl command

> on worker node go and check 













> kubectl logs -f <pod-name>


