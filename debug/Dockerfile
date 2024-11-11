FROM nginx:mainline-alpine
RUN sed -i 's/worker_processes\s\+auto;/worker_processes 1;/' /etc/nginx/nginx.conf && \
    echo http://mirrors.aliyun.com/alpine/v3.10/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.10/community/ >> /etc/apk/repositories && \
    apk update  --no-cache && \
    apk add --no-cache fio ca-certificates \ 
        tzdata nghttp2-libs curl tcpdump upx \
        git iperf3 busybox-extras mysql-client \
        bash bind-tools
