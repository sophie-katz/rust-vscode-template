# Initial Setup

In order to use this project, or other projects that use this as a template, you need to install some system dependencies.

## Initial setup on Linux

Once you clone this repository and open it in VS Code, start by installing Cargo. This will depend on Curl, GCC, OpenSSL, and Pkg-Config. The dependencies for Ubuntu are below:

```bash
# Install needed dependencies if on Ubuntu (20.04)
apt-get install -y \
  curl \
  gcc \
  git \
  lcov \
  libssl-dev \
  pkg-config

# Install Rust via RustUp
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

Then, install the needed Cargo dependencies:

```bash
cargo install \
  cargo-edit \
  cargo-workspaces \
  cargo-tarpaulin
```

## Initial setup with Docker **(recommended)**

Click the green button on the bottom left of the VS Code window, and then select "Reopen in Container". See [https://code.visualstudio.com/docs/remote/containers](https://code.visualstudio.com/docs/remote/containers) for more details.

This will install all dependencies needed within the container as well as the latest version of Rust.
