FROM node:8
WORKDIR /opt
COPY . .
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]
