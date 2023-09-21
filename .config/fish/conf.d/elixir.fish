set -x MIX_HOME $XDG_DATA_HOME/mix
set -x HEX_HOME $XDG_DATA_HOME/hex
set -x ERL_AFLAGS '-kernel shell_history enabled -kernel shell_history_file_bytes 1024000'
set -x ELIXIR_EDITOR 'subl --goto __FILE__:__LINE__' # iex> open Tuple.to_list


status --is-interactive || exit

abbr ism -- iex -S mix
abbr ips -- iex -S mix phx.server
