# Dremio on Minikube

# Tutorial de Implantação do Dremio no Minikube

## Pré-requisitos
- Docker Desktop instalado e em execução
- Minikube instalado
- kubectl instalado
- Verificar se as versões do kubectl do Docker e do kubectl instalado são compatíveis
```bash
# Verificar versão do kubectl
kubectl version --client

# Verificar versão do kubectl do Docker
docker run --rm kubernetesui/dashboard-amd64:v2.7.0 kubectl version --client
```

## Configuração Inicial

### 1. Iniciar o Minikube
```bash
# Iniciar com recursos adequados para o Dremio
minikube start --cpus=12 --memory=22g
```
  kubectl create namespace dremio-ns
  kubectl config set-context --current --namespace=dremio-ns
  
  
  kubectl apply -f .\dremio-conf.yaml
  
  kubectl apply -f .\zk-service.yaml
  
  kubectl apply -f .\deployment_coord.yaml
  
  kubectl get all
  
  kubectl apply -f .\service.yaml
  
  Aguarde 1 minuto!
  
  kubectl apply -f .\deployment_executor.yaml
  
## Ver resultado  
  kubectl get all
NAME                       READY   STATUS    RESTARTS   AGE
pod/dremio-coordinator-0   1/1     Running   0          9m38s
pod/dremio-executor-0      1/1     Running   0          7m46s
pod/dremio-executor-1      1/1     Running   0          7m41s
pod/dremio-executor-2      1/1     Running   0          7m36s

NAME                         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                          AGE
service/dremio-coordinator   ClusterIP   None             <none>        2181/TCP                         9m56s
service/dremio-service       NodePort    10.100.138.125   <none>        9047:30047/TCP,31010:30010/TCP   9m1s

NAME                                  READY   AGE
statefulset.apps/dremio-coordinator   1/1     9m38s
statefulset.apps/dremio-executor      3/3     7m47s

