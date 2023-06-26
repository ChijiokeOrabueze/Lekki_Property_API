FROM ruby:3.1.4

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

RUN mkdir /app
WORKDIR /app

ADD . /app
RUN bundle install

EXPOSE 3000

CMD ["bash"]