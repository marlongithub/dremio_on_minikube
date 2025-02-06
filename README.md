# Dremio on Minikube
YAML files for deploying Dremio on Minikube
## Iniciei minikube assim
 minikube start --cpus=12 --memory=22g
 
## Verifique todos os elementos
```sh
C:\> kubectl get all
```
 
```sh 
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   2d4h

C:\> kubectl get namespaces
NAME              STATUS   AGE
default           Active   2d4h
dremio-ns         Active   2d4h
kube-node-lease   Active   2d4h
kube-public       Active   2d4h
kube-system       Active   2d4h
```
## Se não tiver namespace do dremio dremio-ns, deve criá-lo e tornálo como default
O último comando **`minikube start`** encontrado no log foi:

```sh
minikube start --cpus=12 --memory=22g
```

 **Última execução** foi **12 CPUs** e **22 GB de memória** mas pode mudar esses valores a depender do tipo de implantação.

Caso queira verificar se o Minikube está rodando corretamente, você pode executar:

```sh
minikube status
```
## Se a persistência já foi criada, não há necessidade de executar os yaml referentes à persistência
Verifique assim:
```sh
kubectl get pv,pvc
```
Se for mudar para outro tipo de persitência, delete a atual e configure nos yamls a persitência e a correta referência.

Se precisar setar as réplicas para zero 
```sh
kubectl scale statefulset dremio-coordinator --replicas=0
```
statefulset.apps/dremio-coordinator scaled
```sh
kubectl scale statefulset dremio-executor --replicas=0
```
## Caso necessitar desligar o zookeeper
```sh
kubectl scale deployment zookeeper --replicas=0
```
```sh
kubectl delete deployment zookeeper
```





































