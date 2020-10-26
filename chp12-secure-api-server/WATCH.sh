!/bin/sh
clear

# arg1 is $1
namespace=$1
echo "\$namespace is $namespace"

HR=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)
HR_TOP=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "=")

watch -n 1 -d -t "echo $HR_TOP; \
kubectl top node; \
echo $HR; \
kubectl top pod -n=$namespace; \
echo $HR; \
kubectl get deployment -n=$namespace; \
echo $HR; \
kubectl get all -n=$namespace --show-labels; \
kubectl get endpoints -n=$namespace; \
kubectl get sa -n=$namespace; \
echo $HR; \
kubectl get role -n=$namespace; \
kubectl get rolebinding -n=$namespace; \
echo $HR; \
kubectl get clusterrole; \
kubectl get clusterrolebinding; \
echo $HR; \
kubectl get secrets -n=$namespace; \
echo $HR; \
kubectl get events -n=$namespace; \
echo $HR_TOP"
