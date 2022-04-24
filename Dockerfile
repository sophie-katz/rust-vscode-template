# Start out with the latest Ubuntu LTS version
FROM ubuntu:20.04

# Make sure we install tzdata first so we do not get a user prompt for what
# timezone we are in. This causes the docker build to hang otherwise.
ENV TZ=Etc/UTC
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata

# Update, upgrade, and install apt dependencies
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        curl \
        gcc \
        git \
        lcov \
        libssl-dev \
        pkg-config

# Add the `dev` user and switch to it
RUN useradd -ms /bin/bash dev && \
    mkdir -p /app && \
    chown -R dev:dev /app

USER dev
WORKDIR /app

# Install Cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install global Cargo dependencies
RUN . ~/.cargo/env && \
    cargo install \
        cargo-edit \
        cargo-workspaces \
        cargo-tarpaulin
