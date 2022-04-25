# Guides and How-Tos

## Debug a Binary

A `.vscode/launch.json` entry is already set up for `example-bin`, an example binary package. Feel free to modify it to fit your binary. You can run this from the VS Code debugger sidebar.

## Debug all unit tests for a package

A `.vscode/launch.json` entry is already set up for all of the unit tests in `example-lib`, an example library package. Feel free to modify it to fit your library. You can run this from the VS Code debugger sidebar.

## Debug just one unit test

Just above each unit test in the code, there is a codelens with an option to debug the test.

## Run unit tests

The unit tests are available in the VS Code testing sidebar. They can also be run with the shell command `cargo test`.

## Run linting

Linting runs after every file save, but you can run it manually either with the VS Code task `rust: cargo clippy` or the shell command `cargo clippy`.

## Run formatting

Formatting runs after every file save, but you can run it manually for the full project either with the VS Code task `rust: cargo fmt` or the shell command `cargo fmt`.

## Generate documentation

Documentation is generated after every file save, but you can run it manually either with the VS Code task `rust: cargo doc` or the shell command `cargo doc`.

## Open documentation

The documentation is stored under `target/doc/example-lib/index.html`. Open this with your favorite browser. It will auto-update every time a file is changed (although it may take a moment). Note that `example-lib` is just the name of one of the libraries in this template. If one of your projects is named something else, use that instead!

## Generate coverage report

Coverage is generated after every file save and is visible within VS Code, but you can generate a report manually either with the VS Code task `rust: coverage report` or the following shell commands:

```bash
# Generate coverage info to `lcov.info`
cargo tarpaulin --ignore-tests --out Lcov --line

# Generate HTML report to `coverage/`
genhtml lcov.info --output-directory coverage
```

You can now view the coverage report under `coverage/index.html`.

## Disabling Code Coverage

Edit `.vscode/tasks.json`. Find the section for the task `"rust: on save proxy"` and modify the `"dependsOn"` array so that `"rust: cargo tarpaulin on save"` is commented out. This will prevent code coverage from being regenerated every time a file is saved. Then disable Coverage Gutter by running the VS Code command `"Coverage Gutters: Remove Watch"`.

## Disable Documentation Generation

Edit `.vscode/tasks.json`. Find the section for the task `"rust: on save proxy"` and modify the `"dependsOn"` array so that `"rust: cargo doc on save"` is commented out. This will prevent documentation from being regenerated every time a file is saved.
