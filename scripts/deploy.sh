#!/bin/bash
set -e

echo "Deploying frontend to S3..."
FRONTEND_DIR=frontend/target/release

aws s3 sync $FRONTEND_DIR s3://your-s3-bucket-name --delete --acl public-read
echo "Deployment completed."
