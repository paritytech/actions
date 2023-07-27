
FROM alpine:latest

RUN apk add --update --no-cache git git-lfs
RUN mkdir /repo
WORKDIR /repo

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]
