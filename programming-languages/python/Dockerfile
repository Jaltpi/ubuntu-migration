# Comments: Dockerfile for building a container image for the application

# Use the official Ubuntu image as a base image
FROM ubuntu:20.04

LABEL Maintainer="Jaltpi" \
      Version="1.0" \
      Description="Dockerfile for building a container image for installing uv software dependencies (Python)"

# Set environment variables to avoid interactive prompts during package installation    
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=America/New_York

# Set the working directory
WORKDIR /app

# Copy the shell script to the container
COPY ./uv_installation.sh /usr/local/bin/uv_installation.sh

# Set the script as executable
RUN chmod +x /usr/local/bin/uv_installation.sh

# Run the shell script
RUN /usr/local/bin/uv_installation.sh