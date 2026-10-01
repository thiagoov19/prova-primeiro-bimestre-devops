# Estágio 1: instala dependências de produção
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
COPY src ./src

# Estágio 2: imagem final, enxuta e sem root
FROM node:20-alpine
ENV NODE_ENV=production
WORKDIR /app
COPY --from=build --chown=node:node /app ./
USER node
EXPOSE 3000
CMD ["node", "src/index.js"]
