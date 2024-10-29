# Infrastructure

This directory contains the Terraform infrastructure code for deploying and managing the cloud resources. The infrastructure is built on AWS and includes CDN, storage, and DNS configurations.

## Architecture

The infrastructure consists of the following main components:

- **CDN (CloudFront)**: Serves the static content with low latency
- **Storage (S3)**: Stores the static website files
- **DNS (Route53)**: Manages domain routing (currently disabled)

## Prerequisites

- [Terraform](https://www.terraform.io/) v1.9.8
- AWS credentials with appropriate permissions
- AWS CLI configured locally

## Modules

### CDN Module

- Creates a CloudFront distribution
- Configures Origin Access Identity (OAI)
- Handles SSL/TLS certificates (when enabled)

### Storage Module

- Creates and configures S3 bucket
- Implements bucket policies
- Configures website hosting
- Enables versioning and lifecycle rules

### DNS Module (Currently Disabled)

- Manages Route53 records
- Links domain to CloudFront distribution

## Usage

1. Set up AWS credentials in the `.env` file:

```bash
AWS_ACCESS_KEY_ID="your_access_key"
AWS_SECRET_ACCESS_KEY="your_secret_key"
AWS_REGION="your_region"
BUCKET_NAME="your_bucket_name"
```

2. Initialize Terraform:

```bash
cd ..
./scripts/terraform.sh init
```

3. Review the deployment plan:

```bash
cd ..
./scripts/terraform.sh plan
```

4. Apply the infrastructure:

```bash
cd ..
./scripts/terraform.sh apply
```

## Testing

```bash
cd tests
go test -v
```

## Important Notes

- The S3 bucket has `prevent_destroy` enabled to protect against accidental deletion
- DNS configuration is currently disabled.
- SSL certificate configuration is currently disabled.

## Variables

Key variables that need to be configured:

| Variable              | Description                       | Required |
| --------------------- | --------------------------------- | -------- |
| aws_region            | AWS region for deployment         | Yes      |
| environment           | Deployment environment (dev/prod) | Yes      |
| bucket_name           | Name of the S3 bucket             | Yes      |
| aws_access_key_id     | AWS Access Key ID                 | Yes      |
| aws_secret_access_key | AWS Secret Access Key             | Yes      |
| domain_name           | Domain name (disabled)            | No       |
| certificate_arn       | SSL certificate ARN (disabled)    | No       |
| hosted_zone_id        | Route53 Hosted Zone ID (disabled) | No       |

## Outputs

| Output         | Description                         |
| -------------- | ----------------------------------- |
| cdn_domain     | CloudFront distribution domain name |
| storage_bucket | S3 bucket name                      |
| dns_record     | DNS record name (when enabled)      |
