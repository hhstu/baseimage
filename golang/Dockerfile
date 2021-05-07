FROM golang:1.16.4-alpine AS builder

LABEL stage=gobuilder

ENV CGO_ENABLED=0 GOOS=linux GOPROXY=https://goproxy.cn,direct
# v3.10 upx
RUN echo http://mirrors.aliyun.com/alpine/v3.10/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.10/community/ >> /etc/apk/repositories && \
    apk update  --no-cache && \
    apk add --no-cache  git upx
