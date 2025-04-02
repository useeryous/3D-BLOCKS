    # Use a Node.js image to build the app
    FROM node:16 as builder

    WORKDIR /app

    COPY frontend/package*.json ./
    RUN npm install

    COPY frontend .
    RUN npm run build

    # Use a lightweight Nginx image to serve the app
    FROM nginx:stable-alpine

    COPY --from=builder /app/dist /usr/share/nginx/html
    EXPOSE 80
    CMD ["nginx", "-g", "daemon off;"]