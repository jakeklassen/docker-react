# Build phase
FROM node:12-alpine AS build

WORKDIR /app

COPY . .

RUN yarn install --production && \
  yarn build

# Run phase
FROM nginx

COPY --from=build /app/build /usr/share/nginx/html