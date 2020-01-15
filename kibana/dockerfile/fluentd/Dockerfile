FROM alpine:3.9

RUN apk update \
 && apk add --no-cache \
        ca-certificates \
        ruby ruby-irb ruby-etc ruby-webrick \
        tini geoip\
 && apk add --no-cache --virtual .build-deps \
        build-base linux-headers \
        ruby-dev gnupg \
        make gcc g++ libc-dev \
        wget bzip2 zlib-dev git \
        automake autoconf libtool \
        libc6-compat geoip-dev \
 && echo 'gem: --no-document' >> /etc/gemrc \
 && gem install oj -v 3.8.1 \
 && gem install json -v 2.2.0 \
 && gem install async-http -v 0.49.1 \
 && gem install fluentd -v 1.8.1 \
 && gem install bigdecimal -v 1.4.4 \
 && gem install fluent-plugin-elasticsearch \
 && gem install fluent-plugin-geoip \
 && gem install fluent-plugin-netflow \
 && gem install fluent-plugin-flowcounter \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem


RUN addgroup -S fluent && adduser -S -g fluent fluent \
    && mkdir -p /fluentd/log \
    && mkdir -p /fluentd/etc /fluentd/plugins \
    && chown -R fluent /fluentd && chgrp -R fluent /fluentd

COPY entrypoint.sh /bin/

ENV LD_PRELOAD=""
EXPOSE 24224 5140

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
