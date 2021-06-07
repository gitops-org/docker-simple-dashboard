From node:slim

RUN npm install -g grunt-cli 
RUN npm install .
RUN grunt dev

CMD ["node"]
