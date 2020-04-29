# BUILDER
FROM node:13-alpine AS devv-builder
WORKDIR /app
COPY . .
RUN npm install && node_modules/.bin/tsc

# DEPENDENCIES
FROM node:13-alpine AS devv-dependencies
ENV NODE_ENV=production
WORKDIR /app
COPY . .
RUN apk update && apk upgrade && npm install --production

# FINAL IMAGE
FROM node:13-alpine AS devv-final
ENV NODE_ENV=production
WORKDIR /app
COPY . .
COPY --from=devv-builder ./app/lib ./lib
COPY --from=devv-dependencies ./app/node_modules ./node_modules
EXPOSE 8080
CMD ["npm", "start"]
