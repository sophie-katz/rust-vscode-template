# Rust VS Code Template

<img src="https://img.shields.io/badge/license-MIT-green" /> <img src="https://img.shields.io/badge/rust-1.62-blue" /> <img src="https://img.shields.io/badge/platform-linux%7Cdocker-lightgrey" />

Rust has a really lovely development environment, but the support for it in VS Code is very difficult to set up! There's so many great extensions that are being worked on to improve the developer experience, but they are not easy to find at the moment. This template is how I have my projects set up for Rust in order to provide a decent quality of life.

## Template Features

* Rust language support
  * Intellisense
  * Linting
* Debugging support
* Unit testing support
  * HTML report/inline code coverage
* Documentation generation
* `Cargo.toml` syntax highlighting and quality of life improvements
* Dockerized development environment

## Initial Setup

In order to use this project, or other projects that use this as a template, you need to install some system dependencies.

### Initial setup on Linux **(outside of Docker)**

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

# Install additional Rust components
rustup component add llvm-tools-preview
```

### Initial setup with Docker **(recommended)**

Click the green button on the bottom left of the VS Code window, and then select "Reopen in Container". See [https://code.visualstudio.com/docs/remote/containers](https://code.visualstudio.com/docs/remote/containers) for more details.

This will install all dependencies needed within the container as well as the latest version of Rust.

**NOTE:** This will require Docker to be installed on the host system and the `Remote - Containers` extension to be installed in VS Code.

## How to Use Template

Once the [initial setup](InitialSetup.md) has been completed, projects using this template provide the following features:

Category        | Functionality                      | Usage
--------------- | ---------------------------------- | -----
*Debugging*     | Debug a binary                     | A `.vscode/launch.json` entry is already set up for `example-bin`, an example binary package. Feel free to modify it to fit your binary. You can run this from the VS Code debugger sidebar.<br /><br />**NOTE:** The project must be built first.
|               | Debug all tests for a package      | A `.vscode/launch.json` entry is already set up for all of the unit tests in `example-lib`, an example library package. Feel free to modify it to fit your library. You can run this from the VS Code debugger sidebar.<br /><br />**NOTE:** The project must be built first.
|               | Debug just one test                | Just above each unit test in the code, there is a code lens with an option to debug the test.<br /><br />**NOTE:** Unfortunately, the Rust Test Adapter VS Code extension does not support debugging unit tests from the test explorer.<br /><br />**NOTE:** The project must be built first.
*Testing*       | Run all tests in project           | Tests are all available in the VS Code test explorer.<br /><br />**NOTE:** The project must be built first.
*Linting*       | List the current file              | Linting is automatically run after every file save.
*Formatting*    | Format the current file            | Formatting is automatically done after every file save.
*Documentation* | Generate project documentation     | Run the VS Code task `rust: cargo doc` to generate HTML documentation for the whole project.
|               | View project documentation         | Run the VS Code command `Rust: Doc Viewer`.<br /><br />**NOTE:** The project's HTML documentation must be generated first (see previous).
*Coverage*      | Generate inline test coverage data | Run the VS Code task `rust: llvm-cov --lcov`. This will generate a `lcov.info` file which can be used to display inline test coverage.
|               | View inline test coverage          | Run the VS Code command `Coverage Gutters: Display Coverage`.<br /><br />**NOTE:** The project's inline test coverage data must be generated first (see previous).
|               | Generate HTML test coverage report | Run the VS Code task `rust: llvm-cov --html`.
|               | View HTML test coverage report     | Run the VS Code command `Coverage Gutters: Preview Coverage Report`.<br /><br />**NOTE:** The project's HTML test coverage report must be generated first (see previous).

## Template Updating Checklist

The following items should be checked as part of updating this template to keep it up to date with the latest improvements:

1. **Copyright** - Make sure the copyright year is up to date.

2. **Container Ubuntu Version** - Make sure that the Ubuntu version chosen for the `Dockerfile` is the latest LTS release.

3. **Rust Installation Method** - Go to the main Rust website and look into the installation instructions. If they differ from what is already in the `Dockerfile`, it should be updated.

4. **Rust Global Dependencies** - There are some globally-installed Rust dependencies in the `Dockerfile`. Make sure that they are still appropriate and that no other development has superseded them.

5. **VS Code Extensions** - Go through the list of VS Code extensions in `extensions.json` and make sure they are all still appropriate. Once these are updated, make sure to also update `devcontainer.json`.

6. **Functionality** - Make sure the following functionalities still work: building, cleaning, linting, documentation generation, documentation viewing, running unit tests, debugging unit tests, inline code coverage, code coverage reports, and intellisense.

7. **Initial Setup** - Make sure `InitialSetup.md` matches `Dockerfile`.

8. **Other Documentation** - Update the rest of the Markdown documentation.

There are still open issues with this template. See the [project issues](https://github.com/sophie-katz/rust-vscode-template/issues) for more details.
