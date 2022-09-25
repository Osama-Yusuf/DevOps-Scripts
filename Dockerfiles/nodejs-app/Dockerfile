FROM node:16
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
EXPOSE 5000
CMD [ "node", "server.js" ]
