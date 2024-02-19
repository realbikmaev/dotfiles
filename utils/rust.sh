export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export LD_LIBRARY_PATH="/usr/bin:$LD_LIBRARY_PATH"
alias cargo="cargo +nightly"
alias ct="watchexec -r -w \"./src\" \"cargo test -- --nocapture -q\""
alias ci="watchexec -r -w \"./src\" \"cargo install -q --path . && $1\""
alias cr="watchexec -r -w \"./src\" \"cargo run -q --\""
alias cc="cargo clippy"
alias cb="cargo bench"
