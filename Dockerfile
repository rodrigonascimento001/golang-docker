# Etapa 1: build
FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY main.go .
RUN go mod init temp && go build -ldflags="-s -w" -o fullcycle

# Etapa 2: imagem mínima
FROM scratch
COPY --from=builder /app/fullcycle /fullcycle
ENTRYPOINT ["/fullcycle"]