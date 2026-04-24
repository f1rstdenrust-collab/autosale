FROM node:18-alpine

WORKDIR /

RUN apk add --no-cache postgresql-client

COPY package*.json ./
RUN npm ci --only=production

COPY . .

RUN mkdir -p public/uploads/avatars public/uploads/cars

COPY scripts/init-admin.js /app/scripts/

EXPOSE 3000

CMD ["sh", "-c", "node scripts/init-admin.js && node server.js"]