FROM node:15.13-alpine as build
WORKDIR /react
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
# COPY --from=build /react/blogapi/build /var/www/react
COPY default.conf /etc/nginx/conf.d
EXPOSE 8080
