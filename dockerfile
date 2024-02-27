
FROM node:20 as build
WORKDIR /hotel-app
COPY basics/package.json package.json
RUN npm install
COPY hotel-app .
RUN npm run build

FROM httpd:2.4
COPY ./dist/hotel-app/browser /usr/local/apache2/htdocs/