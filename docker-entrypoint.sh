#!/usr/bin/env sh

if [ -z ${AWSCLI_SKIP_CONFIGURE+x} ]; then
    aws configure
fi

exec "$@"
