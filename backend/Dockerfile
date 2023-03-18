FROM golang:1.20.2-alpine3.17

RUN mkdir /go/src/backend
RUN apk update && apk add git

WORKDIR /go/src/backend

ADD . /go/src/backend

RUN go mod download

RUN go build -o /go/bin/air github.com/cosmtrek/air

CMD ["air", "-c", ".air.toml"]
