# node.js base image
FROM node:14.17.6 AS builder

WORKDIR /src
COPY /src/package.json .
RUN npm install

# app
FROM node:14.17.6

EXPOSE 8000
CMD ["node", "json-server.js"]

WORKDIR /app
COPY --from=builder /src/node_modules/ /app/node_modules/
COPY src/ .