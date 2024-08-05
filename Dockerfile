FROM node:14-alpine AS builder

WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install
COPY . .

FROM nginx:alpine

COPY --from=builder /usr/src/app /usr/src/app
COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/src/app
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
