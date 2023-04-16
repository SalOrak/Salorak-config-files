#!/bin/bash

echo  "[RUST] <<! Rust installation started >>"
echo  "[RUST] <<! Installing rustup... >>"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


echo "[RUST] <<! Adding to the PATH.. >>"
export PATH="$HOME/.cargo/bin:$PATH"


echo "[RUST] <<! Make sure the right Rust Compiler is installed >>"
rustup override set stable
rustup update stable

echo "[RUST] <<! Sourcing cargo env >>"
source "$HOME/.cargo/env"

echo  "[RUST] <<! Rust installation finished >>"
