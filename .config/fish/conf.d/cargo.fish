set -x CARGO_HOME $XDG_DATA_HOME/cargo

fish_add_path $CARGO_HOME/bin


status --is-interactive || exit

abbr cr -- cargo-watch run --quiet
abbr cc -- cargo-watch clippy --quiet
abbr ct -- cargo-watch test --quiet -- --show-output
abbr cl -- cargo lint
abbr crr -- cargo run --release

function cargo-watch
    cargo watch --quiet --clear --delay 0 --exec "$argv"
end

function cargo_example
    cd (mktemp -d)
    cargo new --vcs none example
    cd example
    subl . src/main.rs
end
