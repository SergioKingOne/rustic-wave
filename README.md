# rustic-wave: Modern Static Site Infrastructure

## Project Overview

A modern Infrastructure as Code (IaC) project implementing static website hosting using AWS services, with a Rust-based frontend and Terraform for infrastructure management.

## Technical Stack

- **Frontend**: Rust (using Yew framework)
- **Infrastructure**: Terraform
- **Cloud Provider**: AWS
- **CI/CD**: GitHub Actions
- **Testing**: Rust test framework, Terratest

## Getting Started

### Prerequisites

- Rust and Cargo
- Trunk (Rust web application bundler)
- Terraform v1.9.8
- AWS CLI v1.22.34
- GitHub account with repository access

### Setup Instructions

1. **Automated Setup (Recommended)**

   ```bash
   # Install Ansible if not already installed
   sudo apt-get update && sudo apt-get install -y ansible

   # Run the development environment setup playbook
   ansible-playbook ansible/setup-dev.yml
   ```

2. **Manual Setup**

   ```bash
   git clone https://github.com/yourusername/rustc-wave.git
   cd rustc-wave
   ```

   ```bash
   aws configure
   ```

   ```bash
   cd infrastructure
   terraform init
   ```

   ```bash
   terraform apply -var-file=environments/dev/terraform.tfvars
   ```

   ```bash
   # Install Trunk if not already installed
   cargo install trunk

   # Build and serve the frontend
   trunk serve --release frontend/index.html
   ```

## CI/CD Pipeline

- **CI**: Defined in `.github/workflows/ci.yml`
- **CD**: Defined in `.github/workflows/cd.yml`

## Testing

- **Rust Tests**: Run `cargo test` in the `frontend` directory.
- **Infrastructure Tests**: Run Terratest scripts in `infrastructure/tests`.
- **Load Testing**: Use `k6` scripts.
- **Security Scanning**: Run `tfsec` on Terraform code.

## Documentation

- Architecture diagrams in `docs/`
- API documentation generated with `cargo doc`
- Infrastructure documentation in `infrastructure/README.md`

## Contributing

1. Create a feature branch
2. Implement changes
3. Write/update tests
4. Create a pull request
5. Pass CI checks
6. Code review
7. Merge to main
8. Automated deployment

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
