FROM node:6

RUN npm install -g raml-1-parser

WORKDIR /app

CMD bash
