# Step 1: Specify the base image
FROM nginx:alpine

# Step 2: Set environment variables (optional but useful)
ENV MY_APP_VERSION="1.0"

# Step 3: Copy your website files into the image
COPY ./index.html /usr/share/nginx/html/index.html

# Step 4: Expose the necessary port for the web server
EXPOSE 80

# Step 5: Run Nginx in the foreground to keep the container alive
CMD ["nginx", "-g", "daemon off;"]
