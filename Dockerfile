FROM alpine

ENV PLATFORM x68
ENV VERSYNC_VERSION 1.3.5

RUN wget https://raw.githubusercontent.com/Taygetus/verysync/master/verysync/verysync-linux-${PLATFORM}-v${VERSYNC_VERSION}.tar.gz \
    && tar zxvf verysync-linux-${PLATFORM}-v${VERSYNC_VERSION}.tar.gz \
    && mkdir /data \
    && rm -rf verysync-linux-${PLATFORM}-v${VERSYNC_VERSION}.tar.gz
    
WORKDIR /verysync-linux-${PLATFORM}-v${VERSYNC_VERSION}

VOLUME /data

EXPOSE 8886 22330

ENTRYPOINT ["./verysync","-gui-address","0.0.0.0:8886"]
