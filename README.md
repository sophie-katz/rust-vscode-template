# Rust VS Code Template

<img src="https://img.shields.io/badge/license-MIT-green" /> <img src="https://img.shields.io/badge/rust-1.74-blue" /> <img src="https://img.shields.io/badge/platform-linux%7Cmacos%7Cdocker-lightgrey" />

Rust has a really lovely development environment, but the support for it in VS Code is very difficult to set up! There's so many great extensions that are being worked on to improve the developer experience, but they are not easy to find at the moment. This template is how I have my projects set up for Rust in order to provide a decent quality of life.

**WARNING:** Rust Doc Viewer has a [bug open](https://github.com/JScearcy/rust-doc-viewer/issues/43) where the text is hard to read in dark themes. A workaround is to go to the `/target/doc` directory and open the HTML files in a web browser. (as of September 10, 2023)

## Template Features

* Rust language support
  * Intellisense
  * Linting
* Debugging support
* Unit testing support
* Code coverage HTML report/inline
* Documentation generation
* `Cargo.toml` syntax highlighting and quality of life improvements
* Optional dockerized development environment

## Initial Setup

In order to use this project, or other projects that use this as a template, you need to install some system dependencies.

### Using Docker **(recommended)**

Click the blue or green button on the bottom left of the VS Code window, and then select "Reopen in Container". See [https://code.visualstudio.com/docs/remote/containers](https://code.visualstudio.com/docs/remote/containers) for more details.

This will install all dependencies needed within the container as well as the nightly version of Rust.

**NOTE:** This will require Docker to be installed on the host system and the `Remote - Containers` extension to be installed in VS Code.

### System dependencies on Linux **(outside of Docker)**

Some system dependencies are needed on Linux in order for this template to work:

```shell
# Install needed dependencies if on:
#  * Ubuntu 20.04
#  * Ubuntu 22.04
#  * Debian Bookworm Slim
apt install -y \
  curl \
  gcc \
  git \
  lcov

# Install needed dependencies if on:
#  * Arch Linux
#  * Manjaro
pacman -S \
  gcc \
  git \
  lcov
```

### System dependencies on macOS

No system dependencies are needed on macOS. 😄

### Installing Rust

Follow the instructions on https://www.rust-lang.org/learn/get-started to install Rust.

Then add an additional component:

```shell
rustup component add llvm-tools
```

Then install a global Cargo dependency:

```shell
cargo install cargo-llvm-cov
```

## How to Use Template

Once the [initial setup](InitialSetup.md) has been completed, projects using this template provide the following features:

Category        | Functionality                      | Usage
--------------- | ---------------------------------- | -----
*Building*      | Build workspace                    | A `.vscode/tasks.json` entry is already set up. Press Ctrl+Shift+B to build all crates in the workspace.<br /><br />Or run `cargo build` from the terminal.
*Debugging*     | Debug a binary                     | A `.vscode/launch.json` entry is already set up for `example-bin`, an example binary package. Feel free to modify it to fit your binary. You can run this from the VS Code debugger sidebar.
|               | Debug all tests for a package      | A `.vscode/launch.json` entry is already set up for all of the unit tests in `example-lib`, an example library package. Feel free to modify it to fit your library. You can run this from the VS Code debugger sidebar.
|               | Debug just one test                | Just above each unit test in the code, there is a code lens with an option to debug the test.
*Testing*       | Run all tests in project           | Run the VS Code task `Rust: Test` to run all tests.<br /><br />Or run `cargo test` from the terminal.
*Linting*       | List the current file              | Linting is automatically run after every file save.<br /><br />Or run `cargo clippy` from the terminal.
*Formatting*    | Format the current file            | Formatting is automatically done after every file save.<br /><br />Or run `cargo fmt` from the terminal.
*Documentation* | Generate project documentation     | Run the VS Code task `Rust: Generate Documentation` to generate HTML documentation for the whole project.<br /><br />Or run `cargo doc` from the terminal.
|               | View project documentation         | Run the VS Code command `Rust: Doc Viewer`.<br /><br />**NOTE:** The project's HTML documentation must be generated first (see previous).
*Coverage*      | Generate inline test coverage data | Run the VS Code task `Rust: Generate Inline Coverage`. This will generate a `lcov.info` file which can be used to display inline test coverage.
|               | View inline test coverage          | Run the VS Code command `Coverage Gutters: Display Coverage`.<br /><br />**NOTE:** The project's inline test coverage data must be generated first (see previous).
|               | Generate HTML test coverage report | Run the VS Code task `Rust: Generate Coverage Report`.
|               | View HTML test coverage report     | Run the VS Code command `Coverage Gutters: Preview Coverage Report`.<br /><br />**NOTE:** The project's HTML test coverage report must be generated first (see previous).<br /><br />Or run `cargo llvm-cov --html` from the terminal.

### Profiling

Follow the [Cargo Flamegraph](https://github.com/flamegraph-rs/flamegraph) instructions on how to install it and the needed dependencies: https://github.com/flamegraph-rs/flamegraph#installation

Run these commands to generate a flame graph profile of an executable:

```shell
# On macOS
CARGO_PROFILE_RELEASE_DEBUG=true cargo flamegraph --root

# On Linux
CARGO_PROFILE_RELEASE_DEBUG=true cargo flamegraph
```

See https://github.com/flamegraph-rs/flamegraph for more details about how to profile Rust code.

**NOTE:** If profiling within the dockerized development environment, make sure to enable `perf` for unprivileged users: https://github.com/flamegraph-rs/flamegraph#enabling-perf-for-use-by-unprivileged-users

### GitHub Actions

Follow this guide for instructions on how to set up a GitHub Action: https://eertmans.be/posts/rust-binaries-to-github-action/

## Template Updating Checklist

The following items should be checked as part of updating this template to keep it up to date with the latest improvements:

1. **Readme** - Go through the readme and make sure everything is up to date.

1. **Copyright** - Make sure the copyright year is up to date.

2. **Rust Version** - Make sure that the Rust version is up to date with nightly. Search for the old version number after updating to make sure it's changed in all places.

3. **Container Debian Version** - Make sure that the Debian version chosen for the `Dockerfile` is the latest Slim release.

5. **Rust Global Dependencies** - There are some globally-installed Rust dependencies in the `Dockerfile` and in the readme. Make sure that they are still appropriate and that no other development has superseded them.

6. **VS Code Extensions** - Go through the list of VS Code extensions in `extensions.json` and make sure they are all still appropriate. Once these are updated, make sure to also update `devcontainer.json`.

7. **Functionality** - Make sure all of these functionalities work as expected:
    * All functionalities listed in the table above
    * Linting, inline code coverage, and intellisense in the editor
    * All tasks in `tasks.json`

There are still open issues with this template. See the [project issues](https://github.com/sophie-katz/rust-vscode-template/issues) for more details.
