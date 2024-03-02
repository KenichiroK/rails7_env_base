FROM ruby:3.2.3
# FROM --platform=linux/x86_64 ruby:3.2.3

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem update --system 3.3.20 && \
    bundle install

COPY . /app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]