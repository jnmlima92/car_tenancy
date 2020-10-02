FROM ruby:2.4.2

# Working directory.
RUN mkdir /app
WORKDIR /app
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Script run when container first starts.
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
