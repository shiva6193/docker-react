FROM node:alpine as builder

WORKDIR '/app/code'

COPY package.json .
RUN npm install
COPY . .
RUN npm build


FROM nginx
COPY --from=builder /app/code/build /usr/share/nginx/html
