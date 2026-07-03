FROM alpine:3.24.1

RUN apk --no-cache --no-progress add git ca-certificates tzdata make \
    && update-ca-certificates \
    && rm -rf /var/cache/apk/*

ARG TARGETPLATFORM
COPY ./dist/$TARGETPLATFORM/piceus .

USER 65534

ENTRYPOINT ["/piceus"]
EXPOSE 80
