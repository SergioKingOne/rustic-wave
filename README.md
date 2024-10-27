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
- Terraform
- AWS CLI
- GitHub account with repository access

### Setup Instructions
1. **Clone the repository**
    ```bash
    git clone https://github.com/yourusername/rustc-wave.git
    cd rustc-wave
    ```

2. **Configure AWS Credentials**
    ```bash
    aws configure
    ```

3. **Initialize Terraform**
    ```bash
    cd infrastructure
    terraform init
    ```

4. **Deploy Infrastructure**
    ```bash
    terraform apply -var-file=environments/dev/terraform.tfvars
    ```

5. **Build Frontend**
    ```bash
    cd ../frontend
    cargo build --release
    ```

6. **Deploy Frontend**
    ```bash
    ../scripts/deploy.sh
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
