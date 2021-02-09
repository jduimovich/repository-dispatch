# Minimal curl tool needed 
FROM alpine:3.10
RUN apk add curl

# Repository script can be run inside and shell or container (with curl)
COPY repository-dispatch.sh /repository-dispatch.sh
ENTRYPOINT ["/bin/sh", "/repository-dispatch.sh"]