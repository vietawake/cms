FROM node:12.13.0-alpine as builder
WORKDIR /app
COPY package*.json ./

RUN npm install
COPY . .

CMD ["npm", "run", "build"]

