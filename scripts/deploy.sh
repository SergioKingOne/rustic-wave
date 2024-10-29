#!/bin/bash
set -e

# Load environment variables
source .env

# Export AWS credentials explicitly
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_REGION

echo "Deploying frontend to S3..."

# Print current directory
echo "Current directory: $(pwd)"
 
# Build the frontend
trunk build --release frontend/index.html

# Sync the frontend to S3
aws s3 sync frontend/dist s3://rustic-wave --delete

echo "Deployment completed."