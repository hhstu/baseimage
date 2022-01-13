FROM alpine:3.13.5
RUN apk update  --no-cache && \
    apk add --no-cache fio ca-certificates tzdata nghttp2-libs curl tcpdump upx git iperf3 busybox-extras
CMD tail -f /dev/null
