FROM ruby:2.6.6-alpine
# FROM ruby:2.4.2

# Working directory.
RUN mkdir /app
WORKDIR /app

# install dependencies for application
RUN apk -U add --no-cache \
bash \
build-base \
git \
postgresql-dev \
postgresql-client \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
imagemagick \
tzdata \
less \
&& rm -rf /var/cache/apk/* 

# Script run when container first starts.
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
