FROM golang:alpine AS stage1

WORKDIR /app
COPY    /app .

RUN apk add --no-cache go
RUN go build main.go

FROM scratch AS stage2
WORKDIR /app
COPY --from=stage1 /app .
CMD ["./main"]