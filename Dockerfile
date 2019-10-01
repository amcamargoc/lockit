# Use an official Ruby runtime as main image:
FROM ruby:2.3-alpine

# install sqlite

RUN apk add --update \
    build-base \
    mariadb-dev \
    sqlite-dev \
    nodejs \
    tzdata

COPY . ./app

# mkdir /app && cd
WORKDIR  /app

RUN gem install bundler & bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]



