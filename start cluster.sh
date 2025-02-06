#!/bin/bash

echo "Configurando o namespace padrão para dremio-ns..."
kubectl config set-context --current --namespace=dremio-ns
echo

echo "Aplicando os PersistentVolumes e PersistentVolumeClaims, se necessário..."
# kubectl apply -f pv_pvc_coord.yaml
# kubectl apply -f pv_pvc_exctor.yaml
echo

echo "Aplicando os ConfigMaps do coordinator e executor..."
kubectl apply -f coord_config_map.yaml
kubectl apply -f exec_config_map.yaml
echo

echo "Aplicando o Deployment e Service do Zookeeper..."
kubectl apply -f zookeeper_deploy.yaml
kubectl apply -f zookeeper_service.yaml
echo

echo "Aplicando o serviço principal do Dremio..."
kubectl apply -f servico_principal.yaml
echo

echo "Aplicando o StatefulSet do coordinator..."
kubectl apply -f coord_statefulset.yaml
echo

echo "Aplicando o StatefulSet dos executores..."
kubectl apply -f exec_statefulset.yaml
echo

echo "Verificando o estado dos recursos no namespace dremio-ns..."
kubectl get all
echo

echo "O cluster foi ativado com sucesso."
