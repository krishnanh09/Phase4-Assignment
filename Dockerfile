#stage 1
FROM node:latest as node
WORKDIR /usr/src/app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /usr/src/app/dist/app  /usr/share/nginx/html
COPY /nginx.conf  /usr/src/app
# Expose port 80
EXPOSE 80