dashboard.yaml - https://github.com/kubernetes/dashboard/blob/master/aio/deploy/recommended/kubernetes-dashboard.yaml

kubectl apply -f dashboard.yaml

kubectl get pods -n kube-system

cat <<EOF | kubectl create -f -
> apiVersion: v1
> kind: ServiceAccount
> metadata:
>   name: admin-user
>   namespace: kube-system
> ---
> apiVersion: rbac.authorization.k8s.io/v1beta1
> kind: ClusterRoleBinding
> metadata:
>   name: admin-user
> roleRef:
>   apiGroup: rbac.authorization.k8s.io
>   kind: ClusterRole
>   name: cluster-admin
> subjects:
> - kind: ServiceAccount
>   name: admin-user
>   namespace: kube-system
> EOF


 kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
 
 

Agenda

##Introduction 
-Linux Container Basics 
- Docker Basics 
- Handson on Few Scenerios [Docker] 
- What is Kubernetes? 
- What does Kubernetes do? 

5 Min Break 

##Architecture 
- Master Components 
- Node Components 
- Brief discussion on Networking and Storage 
- Scale up and scale down pods 
- Handson on Few Scenerios 
- Kubernetes and Docker 
- DevOps with Kubernetes 

=========================================

Kubernetes	Essential Kubernetes Concepts
 	Architecture
 	Dockerization
 	Key components of Kubernetes Deployment
 	Deploying and Scaling
 	Alerts, logging, and resource management
Docker	Template Management
 	Yaml Syntax
 	Building Container Images
 	Dockerizing Node.js
 	Optimise Builds With Docker OnBuild
 	Ignoring Files During Build
 	Create Data Containers
 	Creating Networks Between Containers using Links
 	Creating Networks Between Containers using Networks
 	Persisting Data Using Volumes
 	Manage Container Log Files
 	Adding Docker Metadata & Labels
 	Load Balancing Containers
 	Orchestration using Docker Compose
 	See Container Metrics With Docker Stats
 	Creating Optimised Docker Images using Multi-Stage Builds
 	Formatting PS Output
 	Learn Docker Swarm 101


