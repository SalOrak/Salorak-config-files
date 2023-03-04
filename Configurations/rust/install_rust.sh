#!/bin/bash

echo  "<<! Installing rustup... >>"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


echo "<<! Adding to the PATH.. >>"
export PATH="$HOME/.cargo/bin:$PATH"


echo "<<! Make sure the right Rust Compiler is installed >>"
rustup override set stable
rustup update stable

echo "<<! Sourcing cargo env >>"
source "$HOME/.cargo/env"

