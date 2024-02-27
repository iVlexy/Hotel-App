
FROM node:20 as build
WORKDIR /hotel-app
COPY hotel-app/package.json package.json
RUN npm install
COPY hotel-app .
RUN npm run build

FROM httpd:2.4
COPY --from=build ./dist/hotel-app/browser /usr/local/apache2/htdocs/
