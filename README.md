# Rust VS Code Template

Rust has a really lovely development environment, but the support for it in VS Code is very difficult to set up! There's so many great extensions that are being worked on to improve developer experience, but they are not easy to find at all. This is how I have my projects set up - it provides a decent amount of functionality and quality of life improvements that I rely on at this point.

**This template provides the following features:**

* Rust language support
  * Autocompletion
  * Linting
* Debugging support
* Unit testing support
  * Inline code coverage
* Automatic documentation generation
* `Cargo.toml` syntax highlighting and quality of life improvements.
* Dockerized development container

There are still open issues with this template. See the section below for more details.

## How to Use

### Initial setup on Linux

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

### Initial setup with Docker **(recommended)**

Click the green button on the bottom left of the VS Code window, and then select "Reopen in Container". See [https://code.visualstudio.com/docs/remote/containers](https://code.visualstudio.com/docs/remote/containers) for more details.

This will install all dependencies needed within the container as well as the latest version of Rust.

### Debug a Binary

A `.vscode/launch.json` entry is already set up for `example-bin`, an example binary package. Feel free to modify it to fit your binary. You can run this from the VS Code debugger sidebar.

### Debug all unit tests for a package

A `.vscode/launch.json` entry is already set up for all of the unit tests in `example-lib`, an example library package. Feel free to modify it to fit your library. You can run this from the VS Code debugger sidebar.

### Debug just one unit test

Just above each unit test in the code, there is a codelens with an option to debug the test.

### Run unit tests

The unit tests are available in the VS Code testing sidebar. They can also be run with the shell command `cargo test`.

### Run linting

Linting runs after every file save, but you can run it manually either with the VS Code task `rust: cargo clippy` or the shell command `cargo clippy`.

### Run formatting

Formatting runs after every file save, but you can run it manually for the full project either with the VS Code task `rust: cargo fmt` or the shell command `cargo fmt`.

### Generate documentation

Documentation is generated after every file save, but you can run it manually either with the VS Code task `rust: cargo doc` or the shell command `cargo doc`.

### Open documentation

The documentation is stored under `target/doc/example-lib/index.html`. Open this with your favorite browser. It will auto-update every time a file is changed (although it may take a moment). Note that `example-lib` is just the name of one of the libraries in this template. If one of your projects is named something else, use that instead!

### Generate coverage report

Coverage is generated after every file save and is visible within VS Code, but you can generate a report manually either with the VS Code task `rust: coverage report` or the following shell commands:

```bash
# Generate coverage info to `lcov.info`
cargo tarpaulin --ignore-tests --out Lcov --line

# Generate HTML report to `coverage/`
genhtml lcov.info --output-directory coverage
```

You can now view the coverage report under `coverage/index.html`.

### Disabling Code Coverage

Edit `.vscode/tasks.json`. Find the section for the task `"rust: on save proxy"` and modify the `"dependsOn"` array so that `"rust: cargo tarpaulin on save"` is commented out. This will prevent code coverage from being regenerated every time a file is saved. Then disable Coverage Gutter by running the VS Code command `"Coverage Gutters: Remove Watch"`.

### Disable Documentation Generation

Edit `.vscode/tasks.json`. Find the section for the task `"rust: on save proxy"` and modify the `"dependsOn"` array so that `"rust: cargo doc on save"` is commented out. This will prevent documentation from being regenerated every time a file is saved.

## VS Code Extensions Used

These are the extensions that were installed to the workspace to provide the above features.

* *For code editing:*
  * **[rust-analyzer](https://marketplace.visualstudio.com/items?itemName=matklad.rust-analyzer) by *matklad*** - Language support for Rust
  * **[Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) by *Street Side Software*** - Spellchecking
  * **[Tabnine](https://marketplace.visualstudio.com/items?itemName=TabNine.tabnine-vscode) by *TabNine*** - AI autocompletion
  * **[markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) by *David Anson*** - Linting for Markdown files
* *For debugging:*
  * **[CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb) by *Vadim Chugunov*** - LLDB support for VS Code
* *For unit testing:*
  * **[Test Explorer UI](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer) by *Holger Benl*** - Test sidebar support for a number of languages
  * **[Rust VS Code Test Explorer](https://marketplace.visualstudio.com/items?itemName=swellaby.vscode-rust-test-adapter) by *Swellaby*** - Rust unit tests in sidebar
  * **[Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters) by *ryanluker*** - Code coverage information in gutters
* *For `Cargo.toml` files:*
  * **[Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml) by *tamasfe*** - Syntax highlighting
  * **[Search crates.io](https://marketplace.visualstudio.com/items?itemName=belfz.search-crates-io) by *belfz*** - Autocompletion for crate dependency names
  * **[crates](https://marketplace.visualstudio.com/items?itemName=serayuzgur.crates) by *Seray Uzgur*** - Highlights out-of-date dependencies
* *Miscellaneous:*
  * **[Trigger Task on Save](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.triggertaskonsave) by *Gruntfuggly*** - Used to run code coverage metrics whenever a `*.rs` file is saved

### Why `rust-analyzer` instead of `Rust`?

There is an official extension for Rust language support called [Rust](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust). It has millions of downloads and is a verified extension. Instead of using this, this template uses [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=matklad.rust-analyzer) which has only thousands of installs and is not verified. Why use this instead?

The official extension is a couple years of out of date and has much less support for the language. `rust-analyzer` is very actively being developed. "It is a part of a larger rls-2.0 effort to create excellent IDE support for Rust."

## Cargo Dependencies Used

These are the dependencies that were installed using Cargo to help provide the above features.

* `cargo-edit` - CLI dependency editing for Cargo
* `cargo-workspaces` - CLI workspace management for monorepos
* `cargo-tarpaulin` - Code coverage generation which is actively used by the VS Code tasks

## Open issues

### Tests not compatible between inline and sidebar

Tests in the sidebar are handled by the Rust Test Explorer extension, while the inline test codelens is provided by Rust Analyzer. These two extensions do not have any interoperability, unfortunately.

Tests in the sidebar...

* can be run.
* save their state (whether they were passing or failing as of the last run).
* **cannot** be debugged

Tests inline in the codelens...

* can be run.
* **cannot** save their state
* can be debugged.

### Code coverage has inaccuracies

The code coverage currently uses Tarpaulin, which has a number of issues. The code coverage is not perfect, but is quite close and is sufficient to be used as a guideline for test development.

### Future features to implement

There is more to be added to this template!

* Profiling
* CI/CD
* Command-line tooling
