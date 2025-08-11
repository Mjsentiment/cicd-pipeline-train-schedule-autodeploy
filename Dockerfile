# Stage 1 — Build the app
FROM node:20 AS build

# Set working directory
WORKDIR /usr/src/app

# Copy only package files first for better caching
COPY package*.json ./

# Install dependencies (production + dev)
RUN npm ci

# Copy the rest of the app source
COPY . .

# Build the app (if it’s a frontend or needs transpiling)
RUN npm run build

# Stage 2 — Run the app
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy only built files and production dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy build output from first stage
COPY --from=build /usr/src/app/dist ./dist

# Expose port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
