FROM alpine
MAINTAINER Genki Takiuchi <genki@s21g.com>

RUN apk add --update iproute2 && rm -rf /var/cache/apk/*

COPY ./init /

EXPOSE 8472/udp
ENTRYPOINT ["/init"]
