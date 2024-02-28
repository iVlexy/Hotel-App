FROM node:20-alpine as frontend-deps
WORKDIR /frontend
ADD package.json package-lock.json ./
RUN npm install
ADD ./angular.json ./tsconfig.json ./
ADD ./src ./src

FROM httpd:2.4
COPY --from=build ./src /usr/local/apache2/htdocs/
