FROM alpine:3.13.5
RUN echo http://mirrors.aliyun.com/alpine/v3.10/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.10/community/ >> /etc/apk/repositories && \
    apk update  --no-cache && \
    apk add --no-cache fio ca-certificates tzdata nghttp2-libs curl tcpdump upx git iperf3 busybox-extras
CMD tail -f /dev/null
