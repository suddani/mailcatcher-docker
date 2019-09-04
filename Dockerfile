FROM ruby:2.6.4-alpine as ruby_builder
RUN apk add --update --no-cache \
    ca-certificates \
    openssl \
    g++ \
    gcc \
    libc-dev \
    make \
    patch \
    sqlite-dev \
  && rm -rf /var/cache/apk/*

RUN gem install --no-document mailcatcher

FROM ruby:2.6.4-alpine

RUN apk add --update --no-cache \
     sqlite-libs \
  && rm -rf /var/cache/apk/*

COPY --from=ruby_builder /usr/local/bundle /usr/local/bundle

ENV SMTP_IP=0.0.0.0
ENV SMTP_PORT=1025
ENV HTTP_IP=0.0.0.0
ENV HTTP_PORT=1080
ENV HTTP_PATH=/mailcatcher/

EXPOSE 1025
EXPOSE 1080

WORKDIR /app

ADD . /app

CMD [ "bin/mailcatcher" ]
