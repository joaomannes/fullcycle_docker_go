FROM golang:1.12.0-alpine3.9 as builder

RUN mkdir /app
ADD . /app
WORKDIR /app

RUN GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o main main.go


FROM scratch

COPY --from=builder /app /app
ENTRYPOINT ["/app/main"]
