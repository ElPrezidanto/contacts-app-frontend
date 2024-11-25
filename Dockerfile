FROM node:18

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci

RUN npm install -g @angular/cli
COPY . .

RUN chmod +x node_modules/.bin/ng

RUN npm run build --prod
EXPOSE 80
CMD ["npx", "http-server", "dist/contacts-app-frontend/browser/"]
