# Use the official OpenJDK base image
FROM --platform=linux/arm64 openjdk:11-jre-slim

# Install X11 requirements
RUN apt-get update && apt-get install -y \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the Maven build output to the container
COPY dist/QLTV.jar app.jar

# Don't set DISPLAY here - will be set at runtime
CMD ["java", "-jar", "app.jar"]