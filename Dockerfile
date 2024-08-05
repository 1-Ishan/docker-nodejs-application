FROM node:22-alpine AS builder

WORKDIR /usr/src/app
#COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
COPY . .

RUN npm install

COPY . .
RUN npm build 

#FROM nginx:alpine

#COPY --from=builder /usr/src/app /usr/src/app
#COPY nginx.conf /etc/nginx/conf.d/default.conf

#WORKDIR /usr/src/app
EXPOSE 80

#CMD ["nginx", "-g", "daemon off;"]
CMD ["npm", "start"]
