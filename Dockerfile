FROM docker:28.1.1-alpine3.21

RUN apk add --no-cache \
    git

ADD gitops.sh /usr/bin

ENTRYPOINT /usr/bin/gitops.sh
