# 🌊 Rustic Wave

> Modern Static Site Infrastructure

[![Terraform](https://img.shields.io/badge/Terraform-v1.9.8-7B42BC?style=flat&logo=terraform)](https://www.terraform.io/)
[![Rust](https://img.shields.io/badge/Rust-v1.81.0-000000?style=flat&logo=rust)](https://www.rust-lang.org/)
[![AWS](https://img.shields.io/badge/AWS-Infrastructure-FF9900?style=flat&logo=amazon-aws)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📋 Project Overview

A modern Infrastructure as Code (IaC) project implementing static website hosting using AWS services, with a Rust-based frontend and Terraform for infrastructure management.

## 🛠️ Technical Stack

| Category       | Technology                     |
| -------------- | ------------------------------ |
| Frontend       | Rust (Yew framework)           |
| Infrastructure | Terraform                      |
| Cloud Provider | AWS                            |
| CI/CD          | GitHub Actions                 |
| Testing        | Rust test framework, Terratest |

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

✅ Rust and Cargo  
✅ Trunk (Rust web application bundler)  
✅ Terraform v1.9.8  
✅ AWS CLI v1.22.34  
✅ GitHub account with repository access

### Setup Instructions

#### 1️⃣ Automated Setup (Recommended)

```bash
# Install Ansible if not already installed
sudo apt-get update && sudo apt-get install -y ansible

# Run the development environment setup playbook
ansible-playbook ansible/setup-dev.yml
```

#### 2️⃣ Manual Setup

1. Clone the repository:

```bash
git clone https://github.com/SergioKingOne/rustic-wave.git
cd rustic-wave
```

2. Configure environment variables:

```env
# Create .env file based on .env.example
AWS_ACCESS_KEY_ID=your-access-key-id
AWS_SECRET_ACCESS_KEY=your-secret-access-key
AWS_REGION=your-region
STORAGE_BUCKET_NAME=your-bucket-name
```

3. Initialize and apply infrastructure:

```bash
cd infrastructure
terraform init
./scripts/terraform plan
./scripts/terraform apply
```

4. Set up the frontend:

```bash
# Install Trunk if not already installed
cargo install trunk

# Build and serve the frontend
trunk serve --release frontend/index.html
```

## 🔄 CI/CD Pipeline

| Pipeline               | Configuration              |
| ---------------------- | -------------------------- |
| Continuous Integration | `.github/workflows/ci.yml` |
| Continuous Deployment  | `.github/workflows/cd.yml` |

## 🧪 Testing

| Test Type            | Command/Location                            |
| -------------------- | ------------------------------------------- |
| Rust Tests           | `cargo test` in `frontend/`                 |
| Infrastructure Tests | Terratest scripts in `infrastructure/tests` |
| Load Testing         | `k6` scripts                                |
| Security Scanning    | `tfsec` on Terraform code                   |

## 📚 Documentation

- 📐 Architecture diagrams in `docs/`
- 📖 API documentation via `cargo doc`
- 🏗️ Infrastructure details in `infrastructure/README.md`

## 🤝 Contributing

1. 🌿 Create a feature branch
2. ✨ Implement changes
3. 🧪 Write/update tests
4. 📥 Create a pull request
5. ✅ Pass CI checks
6. 👀 Code review
7. 🔄 Merge to main
8. 🚀 Automated deployment

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
