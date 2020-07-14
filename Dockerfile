FROM ruby:2.6.5
RUN apt-get update && apt-get install -y software-properties-common build-essential libpq-dev curl vim
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN mkdir -p /app
WORKDIR /app
ADD Gemfile* /app/
RUN gem install bundler && bundler install
ADD . /app
