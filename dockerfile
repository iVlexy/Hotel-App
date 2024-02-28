FROM node:20-alpine as build
WORKDIR /frontend
ADD package.json package-lock.json tsconfig.app.json ./
RUN npm install
ADD ./angular.json ./tsconfig.json ./
ADD ./src ./src
# Build frontend code
RUN npm run build

FROM httpd:2.4
COPY --from=build ./frontend/dist/hotel-app/browser/ /usr/local/apache2/htdocs/
