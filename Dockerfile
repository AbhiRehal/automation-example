FROM node:24-alpine

WORKDIR /usr/src/app

COPY app/package.json ./

RUN npm i

COPY app/ .

EXPOSE 3000

CMD ["node", "index.js"]
