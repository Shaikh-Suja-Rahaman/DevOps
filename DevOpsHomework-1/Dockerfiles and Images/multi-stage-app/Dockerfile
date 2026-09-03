# Stage 1: Build Stage
FROM golang:1.20-alpine AS builder
WORKDIR /app
COPY main.go .
RUN go build -o multi-stage-app main.go

# Stage 2: Production Stage
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/multi-stage-app .
EXPOSE 8080
CMD ["./multi-stage-app"]
