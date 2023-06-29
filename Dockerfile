FROM node:16.20.1-bullseye-slim
WORKDIR /app
COPY package.json .
#RUN npm install
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only=production; \
    fi
COPY . ./
ENV PORT 3000
EXPOSE $PORT
CMD ["npm", "run", "dev"]
