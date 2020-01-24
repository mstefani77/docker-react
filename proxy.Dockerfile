FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
RUN npm --proxy http://proxy_vip_swg.srp.gov:8080 install
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
