#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
else
    echo "Warning: .env file not found. Proceeding with existing environment variables."
fi

# Export AWS credentials as TF_VAR variables
export TF_VAR_aws_access_key_id=$AWS_ACCESS_KEY_ID
export TF_VAR_aws_secret_access_key=$AWS_SECRET_ACCESS_KEY
export TF_VAR_aws_region=$AWS_REGION
export TF_VAR_bucket_name=$BUCKET_NAME
export TF_VAR_hosted_zone_id=$HOSTED_ZONE_ID
export TF_VAR_environment=$ENVIRONMENT
export TF_VAR_domain_name=$DOMAIN_NAME
export TF_VAR_create_dns=$CREATE_DNS

# Export AWS environment variables
export AWS_ACCESS_KEY_ID=$TF_VAR_aws_access_key_id
export AWS_SECRET_ACCESS_KEY=$TF_VAR_aws_secret_access_key
export AWS_REGION=$TF_VAR_aws_region

# Set working directory to infrastructure
cd infrastructure

terraform import module.storage.aws_s3_bucket.this $BUCKET_NAME

# Run terraform commands with the passed arguments
terraform "$@"