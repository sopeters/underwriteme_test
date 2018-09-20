FROM golang:alpine as builder
RUN adduser -D -g '' appuser
RUN mkdir /build 
ADD . /build/
WORKDIR /build 

#get dependancies
RUN go get -d -v

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .

FROM scratch
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /build/main /app/
WORKDIR /app
USER appuser
EXPOSE 8484
CMD ["./main"]
