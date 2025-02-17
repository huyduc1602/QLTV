# README.md

# Java Swing Docker Application

This project is a Java Swing application packaged with Docker. It demonstrates how to build and run a Java Swing application using Docker containers.

## Project Structure

```
java-swing-docker
├── src
│   ├── main
│   │   └── java
│   │       └── com
│   │           └── app
│   │               ├── Main.java
│   │               └── SwingApp.java
├── Dockerfile
├── docker-compose.yml
├── pom.xml
└── README.md
```

## Requirements

- Docker
- Docker Compose
- Maven

## Building the Docker Image

To build the Docker image for the application, run the following command in the project root directory:

```bash
docker build -t java-swing-app .
```

## Running the Application

To run the application using Docker Compose, execute the following command:

```bash
docker-compose up
```

This will start the application in a Docker container.

## Accessing the Application

Once the application is running, you can access it through the Docker container's GUI. Make sure to have the necessary configurations for GUI applications in Docker.

## License

This project is licensed under the MIT License.