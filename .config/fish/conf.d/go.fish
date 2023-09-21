set -x GOPATH $XDG_DATA_HOME/go
set -x GOMODCACHE $XDG_CACHE_HOME/go/mod
set -x GOPROXY direct
set -x GOSUMDB off
set -x GOTELEMETRY off
set -x GOTOOLCHAIN local

fish_add_path $GOPATH/bin
