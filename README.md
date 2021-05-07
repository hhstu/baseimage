# baseimage

```shell
docker  buildx  create  --use
docker  buildx build -t basefly/alpine:3.13.5  --platform=linux/arm,linux/arm64,linux/amd64  ./alpine  --push
```

buildx 可以同时构建多种 cpu 架构的镜像，基于 x86 做基础镜像交叉编译生成其他镜像可以加快编译

```shell
FROM --platform=linux/amd64 basefly/golang:1.16.4-alpine AS builder
WORKDIR /build
ARG TARGETARCH
COPY . .
RUN VERSION=$(git name-rev --name-only HEAD)-$(git rev-parse --short HEAD) && \
    echo  $VERSION && \
    GOARCH=${TARGETARCH} go build -ldflags="-s -w -X github.com/xxx/xxx/pkg.Version=${VERSION}"  -o xxx ./cmd && \
    upx ./xxx


FROM basefly/alpine:v3.13.5
WORKDIR /app
COPY --from=builder /build/xxx xxx
CMD ./xxx

```

参考：
https://github.com/docker/buildx#building-multi-platform-images