FROM node:15.13-alpine as build
WORKDIR /react
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine

COPY --from=build blogapi/build /usr/share/nginx/html
# COPY --from=build blogapi/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
