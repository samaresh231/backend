FROM ruby:2.7.2-alpine3.13
RUN apk update
RUN apk add \
    build-base \
    bash \
    mariadb-dev \
    tzdata

RUN gem install bundler
COPY ./Gemfile  ./
COPY ./Gemfile.lock ./

RUN bundle install
COPY ./ ./
CMD ["bundle", "exec","puma"]
