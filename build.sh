#!/bin/sh

set -ex

# Build the `test_console_wasm.wasm` file using Cargo/rustc
cargo +nightly build --target wasm32-unknown-unknown

# Run the `wasm-bindgen` CLI tool to postprocess the wasm file emitted by the
# Rust compiler to emit the JS support glue that's necessary
#
# Here we're using the version of the CLI in this repository, but for external
# usage you'd use the commented out version below
cargo +nightly run \
  --manifest-path ../../wasm-bindgen/crates/cli/Cargo.toml \
  --bin wasm-bindgen \
  -- \
  target/wasm32-unknown-unknown/debug/test_console_wasm.wasm \
  --out-dir web
# wasm-bindgen target/wasm32-unknown-unknown/debug/test_console_wasm.wasm --out-dir .

# Finally, package everything up using Webpack and start a server so we can
# browse the result
pushd web
npm install
npm run serve
