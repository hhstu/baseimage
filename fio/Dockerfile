FROM centos:7 as  builder
RUN yum makecache && yum  install git gcc g++ make -y && git clone https://github.com/axboe/fio.git && cd  fio && \
     git checkout fio-3.20 && ./configure && make

FROM centos:7
COPY --from=builder /fio/fio /usr/bin/fio
CMD tail -f /dev/null