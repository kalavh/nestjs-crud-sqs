FROM node:18.12.1-alpine3.16
ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 8080
EXPOSE 5432
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]

