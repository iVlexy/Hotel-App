FROM node:20-alpine as build
WORKDIR /frontend
ADD package.json package-lock.json tsconfig.app.json ./
RUN npm install
ADD ./angular.json ./tsconfig.json ./
ADD ./src ./src

FROM httpd:2.4
COPY --from=build ./dist/ /usr/local/apache2/htdocs/
