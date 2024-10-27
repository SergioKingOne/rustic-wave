#!/bin/bash
set -e

echo "Building frontend..."
cd frontend
cargo build --release
echo "Build completed."
