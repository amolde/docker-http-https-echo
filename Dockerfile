FROM node:9.2-alpine

WORKDIR /app

COPY . .

RUN rm -rf screenshots/ runme.sh

RUN npm install --production

RUN apk --no-cache add openssl

RUN sh generate-cert.sh

EXPOSE 8080 8443

USER 10001

ENTRYPOINT ["node", "./index.js"]
CMD []
