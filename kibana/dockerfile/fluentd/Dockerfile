FROM fluent/fluentd:v1.7-1

USER root

RUN apk add --update sudo ruby-dev geoip
RUN apk add --update --virtual .build make gcc g++ libc-dev wget bzip2 zlib-dev git linux-headers automake autoconf libtool build-base ruby-dev libc6-compat geoip-dev 
RUN sudo gem install fluent-plugin-elasticsearch
RUN sudo gem install fluent-plugin-geoip
RUN sudo gem install fluent-plugin-netflow
RUN sudo gem install fluent-plugin-flowcounter
RUN sudo gem sources --clear-all
RUN apk del .build
RUN rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent
