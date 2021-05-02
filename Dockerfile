FROM ruby:2.7.3-alpine

RUN apk add --no-cache --update \
ack \
bash \
build-base \
curl \
git \
htop \
less \
libsass \
linux-headers \
nodejs \
npm \
postgresql-client \
postgresql-dev \
python2 \
redis \
tzdata \
vim \
yarn \
zsh

RUN gem install bundler

CMD tail -f /dev/null
