FROM nginx:alpine

ARG OS
ARG ARCH

ENV OS=${OS}
ENV ARCH=${ARCH}

COPY ./install-confd.sh /scripts/install-confd.sh
RUN mkdir -p /etc/confd \
    && /scripts/install-confd.sh

COPY ./confd-dir /etc/confd/
COPY ./nginx-proxy /usr/bin/

ENTRYPOINT nginx-proxy