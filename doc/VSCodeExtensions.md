# VS Code Extensions Used in this Template

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

## Why `rust-analyzer` instead of `Rust`?

There is an official extension for Rust language support called [Rust](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust). It has millions of downloads and is a verified extension. Instead of using this, this template uses [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=matklad.rust-analyzer) which has only thousands of installs and is not verified. Why use this instead?

The official extension is a couple years of out of date and has much less support for the language. `rust-analyzer` is very actively being developed. "It is a part of a larger rls-2.0 effort to create excellent IDE support for Rust."
