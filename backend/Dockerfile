FROM golang:1.20.2-alpine3.17

RUN mkdir /go/src/backend
RUN apk update && apk add git

WORKDIR /go/src/backend

ADD . /go/src/backend

RUN go mod download

RUN go install github.com/air-verse/air@latest

CMD ["air", "-c", ".air.toml"]
