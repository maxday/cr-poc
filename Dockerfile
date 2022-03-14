FROM node:14-slim AS build-env
WORKDIR /app
COPY package.json /app
COPY package-lock.json /app
RUN npm ci --only=production
COPY app.js /app/

FROM gcr.io/distroless/nodejs:16
WORKDIR /app
COPY --from=build-env /app /app
COPY --from=maxday/cr /datadog-agent /app/datadog-agent

ENTRYPOINT ["/app/datadog-agent"]
CMD ["/nodejs/bin/node /app/app.js"]