#! /usr/bin/env bash
set -xe
k8sImageTag=v1.21.9
chmod +x ./k8s/kubeadm
k8sImageNames=$(./k8s/kubeadm   config images   list   --kubernetes-version=${k8sImageTag} )

for each in ${k8sImageNames}
do
  echo  "FROM" ${each} > Dockerfile
  docker buildx build -t basefly${each##k8s.io}  --platform=linux/arm,linux/arm64,linux/amd64   . --push
done

#echo  "FROM" k8s.gcr.io/metrics-server/metrics-server:v0.3.1 > Dockerfile
#docker buildx build -t ${destRepo}/metrics-server:v0.3.1 --platform=linux/arm,linux/arm64,linux/amd64   . --push

#echo  "FROM" k8s.gcr.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2  > Dockerfile
#docker buildx build -t ${destRepo}/nfs-subdir-external-provisioner:v4.0.2 --platform=linux/arm,linux/arm64,linux/amd64   . --push

#echo  "FROM" k8s.gcr.io/kube-state-metrics/kube-state-metrics:v2.0.0  > Dockerfile
#docker buildx build -t ${destRepo}/kube-state-metrics:v2.0.0 --platform=linux/arm,linux/arm64,linux/amd64   . --push

#ceph=quay.io/cephcsi/cephcsi:v3.4.0
#kubecsi=(
# csi-provisioner:v2.2.2
# csi-snapshotter:v4.1.1
# csi-attacher:v3.2.1
# csi-resizer:v1.2.0
# csi-node-driver-registrar:v2.2.0
#)
#for each in "${kubecsi[@]}"
#do
#  echo  "FROM" k8s.gcr.io/sig-storage/${each} > Dockerfile
#  docker buildx build -t basefly/${each}  --platform=linux/arm64,linux/amd64   . --push || exit 1
#done

