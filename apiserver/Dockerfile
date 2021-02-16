######## Start first stage for building #######

FROM golang:1.15.2-alpine3.12 as builder

RUN apk update && \
    apk upgrade && \
    apk add git

WORKDIR $GOPATH/src/github.com/fc-testzone/
RUN git clone https://github.com/fc-testzone/apiserver.git

WORKDIR $GOPATH/src/github.com/fc-testzone/apiserver/
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -v -a -o app .

######## Start a new stage from alpine #######

FROM alpine:3.12

LABEL maintainer="Sergey Denisov <DenisovS21@gmail.com>"

RUN apk update && \
    apk upgrade && \
    apk add ca-certificates && \
    update-ca-certificates && \
    apk add tzdata

RUN rm -rf /var/cache/apk/*

ENV TZ=Asia/Novosibirsk

WORKDIR /root/

COPY --from=builder /go/src/github.com/fc-testzone/apiserver/app .
RUN mkdir /var/log/apiserver/

CMD ["./app"]
