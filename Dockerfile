FROM node:iron-alpine

RUN mkdir -p /usr/src/app && chown -R node:node /usr/src/app

WORKDIR /usr/src/app
COPY package.json yarn.lock ./
USER node
RUN yarn install --pure-lockfile
COPY --chown=node:node . .
EXPOSE 2378
CMD ["yarn", "start"]