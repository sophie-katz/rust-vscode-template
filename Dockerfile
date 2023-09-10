# Start out with the latest Debian Slim version
FROM debian:bookworm-slim

# Update, upgrade, and install apt dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        gcc \
        git \
        lcov \
        linux-perf

# Add the `dev` user and switch to it
RUN useradd -ms /bin/bash dev && \
    mkdir -p /app && \
    chown -R dev:dev /app

USER dev
WORKDIR /app

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y

# Install additional Rust components
RUN . "$HOME/.cargo/env" && \
    rustup component add llvm-tools

# Install additional Cargo dependencies
RUN . "$HOME/.cargo/env" && \
    cargo install cargo-llvm-cov flamegraph
