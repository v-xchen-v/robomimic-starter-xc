#!/bin/bash

# Name of the container
CONTAINER_NAME=robomimic_container

# Image name
IMAGE_NAME=robomimic

# Optional: Mount host code or data directory if needed
# e.g., -v /path/to/data:/workspace/data

docker run --gpus all -itd \
  --name $CONTAINER_NAME \
  --shm-size=16g \
  -v $(pwd):/workspace \
  $IMAGE_NAME

echo "✅ Container '$CONTAINER_NAME' started in background."
