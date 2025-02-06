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
## Ver todos arquivos da pasta para poder começar implantação
```sh
ls
    Diretório: C:\...
Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----        04/02/2025     18:40           1026 coord_config_map.yaml
-a----        04/02/2025     18:38           2490 coord_statefulset.yaml
-a----        04/02/2025     18:15            787 exec_config_map.yaml
-a----        04/02/2025     20:28           2130 exec_statefulset.yaml
-a----        04/02/2025     17:05            875 pv_pvc_coord.yaml
-a----        04/02/2025     17:07            648 pv_pvc_exctor.yaml
-a----        16/01/2025     17:02            136 README.md
-a----        15/01/2025     10:07            542 servico_principal.yaml
-a----        03/02/2025     11:55            197 vm_netshoot.yaml
-a----        04/02/2025     18:10            486 zookeeper_deploy.yaml
-a----        04/02/2025     18:28            198 zookeeper_service.yaml
```




































