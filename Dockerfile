FROM ruby:alpine

# install build dependencies
RUN apk add --no-cache \
    git \
    build-base

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENV PORT 3000
EXPOSE 3000

CMD [ "bundle", "exec", "rackup", "--port", "3000", "--host", "0.0.0.0" ]
