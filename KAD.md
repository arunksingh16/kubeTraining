kubectl run --restart=Never --image=busybox static-busybox --dry-run -o yaml --command -- sleep 1000 > /etc/kubernetes/manifests/static-busybox.yaml

kubectl run --generator=run-pod/v1 nginx --image=nginx

kubectl run --generator=run-pod/v1 nginx --image=nginx --dry-run -o yaml

kubectl run --generator=deployment/v1beta1 nginx --image=nginx


kubectl create deployment --image=nginx nginx

kubectl run --generator=deployment/v1beta1 nginx --image=nginx --dry-run -o yaml

kubectl create deployment --image=nginx nginx --dry-run -o yaml

kubectl run --generator=deployment/v1beta1 nginx --image=nginx --dry-run --replicas=4 -o yaml

kubectl run --generator=deployment/v1beta1 nginx --image=nginx --dry-run --replicas=4 -o yaml > nginx-deployment.yaml

kubectl expose pod redis --port=6379 --name redis-service --dry-run -o yaml

kubectl create service clusterip redis --tcp=6379:6379 --dry-run -o yaml  (This will not use the pods labels as selectors, instead it will assume selectors as app=redis. You cannot pass in selectors as an option. So it does not work very well if your pod has a different label set. So generate the file and modify the selectors before creating the service)

kubectl expose pod nginx --port=80 --name nginx-service --dry-run -o yaml

kubectl create service nodeport nginx --tcp=80:80 --node-port=30080 --dry-run -o yaml

kubectl describe pod kube-scheduler-master --namespace=kube-system

alias kc='kubectl'
alias kgp='kubectl get pods'
alias kgps='kubectl get pods --all-namespaces'
alias kdp='kubectl describe pod'
alias kgs='kubectl get svc'

kubectl logs -f


alias kgc='kubectl get componentstatuses’
alias kctx='kubectl config current-context’
alias kcon='kubectl config use-context’
alias kgc='kubectl config get-context'
