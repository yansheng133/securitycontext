FROM golang:1.17.6-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /main.go .

RUN chmod +x /main.go

EXPOSE 8080

CMD [ "/main.go" ]
