FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password
    # MONGO_DB_HOST=example.com \
    # MONGO_DB_PORT=27017 \
    # MONGO_DB_NAME=foobar

# Create app directory
RUN mkdir -p /app 

# Install app dependencies
WORKDIR /app
COPY /app/package*.json /app/
RUN npm install

COPY /app/* /app/

CMD ["node", "/app/server.js"]

# EXPOSE 3000