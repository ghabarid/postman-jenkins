FROM node:alpine AS node

FROM jenkins/jenkins:alpine

LABEL maintainer="Acris Liu <acrisliu@gmail.com>"

# Switch to root user
USER root

COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/include/node/ /usr/local/include/node/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --from=node /usr/local/share/doc/node/ /usr/local/share/doc/node/
COPY --from=node /usr/local/share/man/man1/node.1 /usr/local/share/man/man1/
COPY --from=node /usr/local/share/systemtap/tapset/node.stp /usr/local/share/systemtap/tapset/

RUN set -ex \
    apk add --no-cache libstdc++ \
    && cd /usr/local/bin \
    && cd /

# Switch to jenkins user ... 
USER jenkins
