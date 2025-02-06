﻿# Dremio on Minikube
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

## Sequência de aplicação com kubectl apply -f [file name]
1 - Aplicar os config maps do coordinator e executor
2 - Aplicar deploy e service do Zookeeper
3 - Aplicar o serviço principal do Dremio
4 - Aplicar statefulset do coordinator
5 - Verificar o estado com kubectl get all (deve estar no namespace dremio-ns como padrão)
6 - Aplicar o statefulset dos execturos (veja antes no yaml se a quantidade de réplicas está correta)
```sh
kubectl get all
NAME                             READY   STATUS    RESTARTS   AGE
pod/dremio-coordinator-0         1/1     Running   0          94s
pod/dremio-executor-0            1/1     Running   0          37s
pod/dremio-executor-1            1/1     Running   0          35s
pod/dremio-executor-2            1/1     Running   0          31s
pod/dremio-executor-3            1/1     Running   0          28s
pod/zookeeper-54f98d8c94-gqp5l   1/1     Running   0          3m10s

NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                          AGE
service/dremio-service   NodePort    10.101.92.167   <none>        9047:30047/TCP,31010:30010/TCP   2m20s
service/zookeeper        ClusterIP   10.99.125.17    <none>        2181/TCP                         3m3s

NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/zookeeper   1/1     1            1           3m10s

NAME                                   DESIRED   CURRENT   READY   AGE
replicaset.apps/zookeeper-54f98d8c94   1         1         1       3m10s

NAME                                  READY   AGE
statefulset.apps/dremio-coordinator   1/1     94s
statefulset.apps/dremio-executor      4/4     38s
```


































