# 第一階段
FROM golang:1.17.2-alpine3.14 AS build

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o app .

# 第二階段
FROM alpine:3.14

# 安裝必要的軟件包
RUN apk --no-cache add ca-certificates

# 從第一階段中複製二進制文件
COPY --from=build /app/app /usr/bin/app

# 暴露端口
EXPOSE 8080

# 設置容器啟動時運行的命令
CMD ["app"]

