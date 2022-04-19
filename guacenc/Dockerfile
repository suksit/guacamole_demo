FROM ubuntu:20.04 as builder

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Bangkok

RUN apt update && apt upgrade -yq && apt install -yq --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libcairo2-dev \
    libjpeg-turbo8-dev \
    libossp-uuid-dev \
    libpng-dev \
    libswscale-dev \
    libtool-bin

WORKDIR /tmp/build

RUN curl https://downloads.apache.org/guacamole/1.4.0/source/guacamole-server-1.4.0.tar.gz | tar -xz && \
    cd guacamole-server-1.4.0 && \
    ./configure --prefix=/opt/guacamole-server && \
    make && \
    make install

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Bangkok

RUN apt update && apt upgrade -yq && apt install -yq --no-install-recommends \
    libavcodec58 \
    libavformat58 \
    libavutil56 \
    libossp-uuid16 \
    libswscale5

COPY --from=builder /opt/guacamole-server /usr

ENTRYPOINT ["guacenc", "-s", "1920x1080", "-r", "4000000"]
