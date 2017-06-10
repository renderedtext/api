FROM ruby:2.3.1

RUN wget -O - https://nodejs.org/dist/v6.10.0/node-v6.10.0-linux-x64.tar.xz | tar Jx --strip=1 -C /usr/local

ARG GEMFURY_PASSWORD

ENV BUNDLE_PATH="/gems"
ENV BUNDLE_BIN_PATH="/gems/bin"
ENV BUNDLE_APP_CONFIG="/gems"
ENV DOCKER=true

WORKDIR /app

RUN mkdir -p doc
RUN npm install -g raml2obj

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ENV NODE_PATH=/usr/local/lib/node_modules

CMD ./scripts/server
