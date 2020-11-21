FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y nodejs imagemagick libmagickwand-dev php-pear php-dev

RUN pecl install imagick

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
