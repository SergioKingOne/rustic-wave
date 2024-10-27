# Rustc-Wave Frontend

This is the frontend of the rustc-wave project, built using Rust and the Yew framework.

## Getting Started

### Prerequisites
- Rust and Cargo
- wasm-pack
- Trunk

### Setup
1. **Install Dependencies**
    ```bash
    cargo install trunk
    cargo install wasm-bindgen-cli
    ```

2. **Build the Project**
    ```bash
    trunk build --release
    ```

3. **Run Locally**
    ```bash
    trunk serve
    ```


## Scripts
- **Build**: `cargo build --release`
- **Test**: `cargo test`
- **Serve**: `trunk serve`
