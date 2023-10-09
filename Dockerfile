# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY ./requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy your Nginx configuration file
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

# Copy the rest of the application code into the container
COPY ./server /app/

# Expose port 80 for Nginx
EXPOSE 80

# Expose port 8000 for FastAPI
EXPOSE 8000

# Start nginx server and uvicorn with start script
CMD ["sh", "./start.sh"]
