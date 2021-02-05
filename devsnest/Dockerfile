FROM ruby:2.7.2-alpine3.13
COPY ./Gemfile  ./
COPY ./Gemfile.lock ./
RUN apk update
RUN apk add bash
RUN apk add tzdata
RUN apk add build-base
RUN apk add mariadb-dev
RUN bundle install
COPY ./ ./
CMD ["bundle", "exec","puma"]

