# Portions Copyright (c) 2020 Tailscale Inc & AUTHORS All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

FROM golang:1.15-alpine AS build-env

WORKDIR /go/src/tailscale

#COPY go.mod .
#COPY go.sum .
RUN apk add git
RUN git clone https://github.com/tailscale/tailscale.git .
RUN git checkout -b v1.2.9
RUN go mod download

COPY . .

RUN go install -v ./cmd/...

FROM alpine:3.11
RUN apk add --no-cache ca-certificates iptables iproute2
COPY --from=build-env /go/bin/* /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
