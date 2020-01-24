FROM node:alpine

WORKDIR '/app'

COPY package.json . 
RUN npm --proxy http://proxy_vip_swg.srp.gov:8080 install

COPY . . 

CMD ["npm", "run", "start"]
