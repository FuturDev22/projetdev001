# Étape 1 : Build de l'application Angular
FROM node:14 AS build
WORKDIR /app
COPY package.json ./
RUN npm install --legacy-peer-deps
COPY . .
# Installez Angular CLI de manière globale
RUN npm install -g @angular/cli

# Condition pour choisir la commande de construction Angular en fonction de l'argument
ARG versionAngular
RUN if [ "13" -le "13" ]; then       ng build --configuration=production;     else       ng build --prod;     fi
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "8087"]

