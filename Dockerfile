# Specify a base image
FROM node:12.18.1

WORKDIR /usr/app

# Install some dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm install -g grunt-cli
RUN grunt dev

# Default command
CMD ["npm","start"]
