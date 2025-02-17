#!/bin/bash

# Install XQuartz if not present
if ! command -v xquartz &> /dev/null; then
    brew install --cask xquartz
fi

# Kill existing XQuartz process and start fresh
pkill XQuartz || true
open -a XQuartz
sleep 5

# Configure XQuartz
defaults write org.xquartz.X11 app_to_run ''
defaults write org.xquartz.X11 nolisten_tcp 0

# Get IP for display
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
[ -z "$IP" ] && export IP=$(ifconfig en1 | grep inet | awk '$1=="inet" {print $2}')

# Configure X11 security
xhost + $IP

# Build and run container
docker build --platform linux/arm64 -t qltv .
docker run --rm \
    --platform linux/arm64 \
    -e DISPLAY=$IP:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    qltv

# Cleanup
xhost -