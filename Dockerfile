FROM node:16-alpine3.13 as builder

WORKDIR /usr/src/client

COPY package.json .
COPY yarn.lock .

RUN yarn

COPY . .

RUN npm run build

CMD ["sh", "-c", "yarn", "start"]

# FROM nginx
# EXPOSE 3000
# COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
# COPY --from=builder /app/build /usr/share/nginx/html