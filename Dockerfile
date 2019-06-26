FROM alpine:3.9

RUN apk update
RUN apk -Uuv add bash ca-certificates openssl git openssh util-linux && \
    rm /var/cache/apk/*

# Install aws-cli for CloudFormation
RUN apk -Uuv add groff less python py-pip && \
    pip install awscli && \
    apk --purge -v del py-pip && \
    rm /var/cache/apk/*

# Install JQ
RUN apk -Uuv add jq && \
    rm /var/cache/apk/*

# Add the main scripts
ADD src/func.bash /usr/share/misc/func.bash

# AWS Cloud resources
ADD src/deploy-openshift.bash /usr/bin/deploy-openshift

RUN chmod a+x /usr/bin/deploy-*