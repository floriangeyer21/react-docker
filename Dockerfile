FROM node:16-alpine as builder
WORKDIR '/usr/app'
COPY package.json .
RUN npm install
COPY . .
CMD npm run build

FROM nginx
ExPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html

