FROM node:15.13-alpine
WORKDIR /react
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FROM nginx:stable-alpine

# COPY --from=build /react/blogapi/build /var/www/react

# COPY --from=build blogapi/build /usr/share/nginx/html
# COPY --from=build blogapi/
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
