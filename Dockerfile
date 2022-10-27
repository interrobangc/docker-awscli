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

USER aws

WORKDIR /app

CMD ["bash"]
