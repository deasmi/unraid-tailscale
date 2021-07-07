FROM alpine:latest as build
RUN apk add --no-cache bash wget
WORKDIR /work
COPY ./download.sh .
RUN ./download.sh 
RUN ls 

FROM alpine:latest as deploy
RUN apk add --no-cache ca-certificates iptables iproute2
WORKDIR /app
COPY  --from=build /work/latest/* /app
COPY docker-entrypoint.sh /app
ENTRYPOINT ["/app/docker-entrypoint.sh"]

MAINTAINER Dean Smith dean@zelotus.com
