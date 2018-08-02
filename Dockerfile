FROM alpine:3.8

RUN apk --no-cache --update add \
        python \
        py-pip \
        py-setuptools \
        ca-certificates \
        groff \
        less \
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
