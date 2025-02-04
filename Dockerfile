FROM node:22.12-alpine AS builder

# Must be entire project because `prepare` script is run during `npm install` and requires all files.
COPY src /app
COPY tsconfig.json /tsconfig.json
COPY package.json /package.json
COPY package-lock.json /package-lock.json

WORKDIR /app

ENV NODE_ENV=production

RUN npm ci --ignore-scripts --omit-dev

ENTRYPOINT ["node", "dist/index.js"]