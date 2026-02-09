FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 1337

ENV NODE_ENV=development

CMD ["npm", "run", "develop"]
