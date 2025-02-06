@echo off
echo Desativando o StatefulSet dos executores...
kubectl delete statefulset dremio-executor -n dremio-ns
echo.

echo Desativando o StatefulSet do coordenador...
kubectl delete statefulset dremio-coordinator -n dremio-ns
echo.

echo Desativando o Deployment do Zookeeper...
kubectl delete deployment zookeeper -n dremio-ns
echo.

echo Desativando os Services associados...
kubectl delete service dremio-service zookeeper -n dremio-ns
echo.

echo Verificando a remoção dos recursos...
kubectl get all -n dremio-ns
echo.

echo A persistência desse cluster não foi removida. Remova-a manualmente, caso desejar. Tenha cautela.
pause