# baseimage

```shell
docker  buildx  create  --use
docker  buildx build -t basefly/alpine:3.13.5  --platform=linux/arm,linux/arm64,linux/amd64  ./alpine  --push
```