# Use a stable Node LTS on Alpine for small image size
FROM node:18-alpine

WORKDIR /app

# Set environment
ENV NODE_ENV=production

# Install only production dependencies (uses package-lock.json if present)
COPY package*.json ./
RUN npm ci --only=production

# Copy app source
COPY . .

# Expose the port your app listens on
EXPOSE 3000

# Start the app using node (safe because package.json 'start' has a typo)
CMD ["node", "index.js"]
