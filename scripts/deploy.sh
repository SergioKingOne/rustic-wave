#!/bin/bash
set -e

# Load environment variables
if [ -f .env ]; then
    export $(cat .env | xargs)
else
    echo "Warning: .env file not found. Proceeding with existing environment variables."
fi

# Export AWS credentials explicitly
export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_REGION
export RUSTFLAGS='-C target-feature=+bulk-memory'

echo "Deploying frontend to S3..."

# Build the frontend
trunk build --release

# Sync the frontend to S3
aws s3 sync frontend/dist s3://rustic-wave --delete

echo "Deployment completed."