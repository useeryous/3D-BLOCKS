    # Use the official Node.js image as base
    FROM node:16

    # Set working directory
    WORKDIR /app

    # Copy package.json and install dependencies
    COPY package*.json ./
    RUN npm install

    # Copy the rest of the application files
    COPY . .

    # Expose port
    EXPOSE 3000

    # Command to run the application
    CMD ["npm", "start"]