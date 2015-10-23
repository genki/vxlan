FROM alpine
MAINTAINER Genki Takiuchi <genki@s21g.com>

RUN apk add --update iproute2 && rm -rf /var/cache/apk/*

RUN mkdir -p /vxlan
WORKDIR /vxlan
COPY ./init ./

ENTRYPOINT ["/vxlan/init"]
