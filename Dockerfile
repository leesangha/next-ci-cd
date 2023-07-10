FROM node:alpine

ENV PORT 3000

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --legacy-peer-deps

COPY ./ ./

ENV NODE_ENV production

RUN npm run build --if-present

CMD ["npm", "run", "start"]