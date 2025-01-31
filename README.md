﻿# Dremio on Minikube
YAML files for deploying Dremio on Minikube
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
minikube start --cpus=12 --memory=18g
```

### 2. Criar e Configurar Namespace
```bash
# Criar namespace
kubectl create namespace dremio-ns

# Configurar dremio-ns como namespace padrão
kubectl config set-context --current --namespace=dremio-ns
```

## Implantação do Dremio

### 1. Aplicar o Coordinator
```bash
kubectl apply -f deployment_coord.yaml

# Verificar status do pod do coordinator
kubectl get pods
# Aguarde até o status mudar para "Running"
```

### 2. Aplicar os Executors
```bash
kubectl apply -f deployment_executor.yaml

# Verificar status dos pods dos executors
kubectl get pods
```

### 3. Aplicar o Service
```bash
kubectl apply -f service.yaml

# Obter URLs de acesso
minikube service dremio-service --url
```

### 4. Verificar Todos os Recursos
```bash
kubectl get all
```

### 5. Acessar Interface Web
```bash
# Abrir dashboard do Minikube
minikube dashboard

# Usar a primeira URL fornecida pelo comando service --url no navegador
# Exemplo: http://127.0.0.1:xxxxx
```

## Arquivos de Configuração

### deployment_coord.yaml
```yaml
[Conteúdo do arquivo deployment_coord.yaml fornecido]
```

### deployment_executor.yaml
```yaml
[Conteúdo do arquivo deployment_executor.yaml fornecido]
```

### service.yaml
```yaml
[Conteúdo do arquivo service.yaml fornecido]
```

## Notas Importantes
- O namespace deve ser especificado em todos os comandos se não foi definido como padrão
- Se tentar escalar para 3 executors, pode ocorrer erro de memória insuficiente, devido limitação de start desse minikube que testei.
- A primeira URL fornecida é para acesso web, a segunda para conexão JDBC
- Use o Minikube Dashboard para monitoramento visual dos recursos

## Troubleshooting
- Se precisar verificar logs: `kubectl logs <nome-do-pod>`
- Para verificar eventos: `kubectl get events --sort-by='.metadata.creationTimestamp'`
- Para descrever um pod: `kubectl describe pod <nome-do-pod>`
