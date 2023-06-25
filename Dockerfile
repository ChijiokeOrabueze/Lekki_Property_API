# FROM ruby:3.1.4
# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
# RUN mkdir /app
# WORKDIR /app
# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
# RUN bundle install
# COPY . /app/
# EXPOSE 3000
# CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:3.1.4

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle install

EXPOSE 3000

CMD ["bash"]