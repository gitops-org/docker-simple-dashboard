From node:slim

RUN npm install -g grunt-cli 
RUN grunt dev

CMD ["node"]
