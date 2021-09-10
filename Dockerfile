#build app (output: /app/build)
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#run the build on nginx server
#(/usr/share... is default serving path of nginx)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
