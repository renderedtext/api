FROM ruby:2.3.1

# install Node.js
RUN curl https://gist.githubusercontent.com/shiroyasha/58d3ed589c613257ef856c2bdce86fa7/raw/node-6-3-1.sh | bash

ENV BUNDLE_PATH="/gems"
ENV BUNDLE_BIN_PATH="/gems/bin"
ENV BUNDLE_APP_CONFIG="/gems"

WORKDIR /app
CMD ./scripts/server
