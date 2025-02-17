# QLTV - Library Management System

## Prerequisites

1. Install required software:
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install XQuartz for GUI support
brew install --cask xquartz

# Install Docker Desktop for Mac
brew install --cask docker
```
2. Setup Database

Copy SQL script to the correct location
```bash
cp database.sql java-swing-docker/init-db.sql
```

Run SQL script using Docker
```bash
docker exec -i sqlserver /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'P@ssw0rd' -i /init-db.sql
```

## Update database connection settings in src/bkapt/com/helper/Connect.java:
Set username: sa
Set password: P@ssw0rd
Host: localhost
Port: 1433

## Build and Run
```bash
mkdir -p java-swing-docker/{dist,lib}
cp QLTV.jar java-swing-docker/dist/
cp -r lib/* java-swing-docker/lib/
```

## Additional Notes
For printing functionality, Jasper Reports plugins are included in the lib folder
Make sure XQuartz is running before starting the application
If you encounter X11 display issues:
```bash
xhost + localhost
touch /tmp/.docker.xauth
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
```


## Troubleshooting
If you can't connect to the database:

- Ensure SQL Server is running
- Check if port 1433 is not blocked
- Verify credentials in Connect.java
------------
If GUI doesn't appear:

- Restart XQuartz
- Check DISPLAY environment variable
- Verify X11 forwarding is working

# Original Setup Steps (Legacy)
1. Run SQL file to create database
2. Open project in IDE
3. Update database connection in ConnectDao class
4. Add Jasper Reports plugins for printing functionality
5. Run the application

## Quick Start
-------------

To quickly run the application, you can use the provided `run.sh` script.

### How to Run

1. Open a terminal and navigate to the project directory
2. Run the command `./run.sh`

The `run.sh` script will automatically install and run the application for you.

### Note

* The `run.sh` script only works on Linux and macOS operating systems.
* The `run.sh` script installs and runs the application using the `npm install` and `npm start` commands.