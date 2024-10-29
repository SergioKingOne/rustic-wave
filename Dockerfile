# Build stage
FROM rust:1.81.0 as builder

# Install dependencies
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install trunk
RUN cargo install trunk
RUN cargo install wasm-bindgen-cli
RUN rustup target add wasm32-unknown-unknown

# Set working directory
WORKDIR /app

# Copy only necessary files
COPY frontend/ frontend/
COPY Cargo.toml .
COPY config/ config/

# Build the frontend
WORKDIR /app/frontend
RUN trunk build --release

# Deploy stage
FROM amazon/aws-cli:latest

# Install terraform
RUN yum install -y yum-utils shadow-utils && \
    yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo && \
    yum -y install terraform && \
    yum clean all

# Copy built assets, deployment and terraform scripts
COPY --from=builder /app/frontend/dist ./dist
COPY scripts/deploy.sh /usr/local/bin/deploy.sh
COPY scripts/terraform.sh /usr/local/bin/terraform.sh
COPY infrastructure/ ./infrastructure/

# Make scripts executable
RUN chmod +x /usr/local/bin/deploy.sh /usr/local/bin/terraform.sh

# Run terraform script
RUN /usr/local/bin/terraform.sh init
RUN /usr/local/bin/terraform.sh plan
RUN /usr/local/bin/terraform.sh apply

# Set entrypoint to deploy script
ENTRYPOINT ["/usr/local/bin/deploy.sh"]