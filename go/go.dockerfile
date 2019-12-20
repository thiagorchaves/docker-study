FROM golang AS buildando

WORKDIR /app
ADD . /app
RUN go build -o goapp
ENTRYPOINT ./goapp

FROM alpine:3.1
COPY --from=buildando /src/goapp /app
ENTRYPOINT ./goapp