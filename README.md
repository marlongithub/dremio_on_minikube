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

Isso indica que na sua **última execução** você usou **12 CPUs** e **22 GB de memória**.

Se precisar repetir o mesmo comando para iniciar o Minikube com essa configuração, basta rodar:

```sh
minikube start --cpus=12 --memory=22g
```

Caso queira verificar se o Minikube está rodando corretamente, você pode executar:

```sh
minikube status
```
