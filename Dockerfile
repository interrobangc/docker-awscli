FROM alpine:3.16

RUN apk --no-cache --update add \
        python3 \
        py3-pip \
        py3-setuptools \
        openssh-client \
        ca-certificates \
        groff \
        less \
        jq \
        bash \
        wget \
        unzip \
        && \
    pip --no-cache-dir install \
        awscli \
        && \
    addgroup -S aws&& \
    adduser -G aws -D aws

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

USER aws

WORKDIR /app

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

CMD ["bash"]
