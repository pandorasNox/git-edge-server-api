#!/usr/bin/env bash

set -o errexit
set -o nounset
# set -o xtrace

if set +o | grep --quiet --fixed-strings 'set +o pipefail'; then
  # shellcheck disable=SC3040
  set -o pipefail
fi

if set +o | grep --quiet --fixed-strings 'set +o posix'; then
  # shellcheck disable=SC3040
  set -o posix
fi

# -----------------------------------------------------------------------------

__usage="
Usage: $(basename $0) [OPTIONS]

Options:
  -h, --help        print help

commands:
  hello             print hello + 2nd argument (e.g. '$ ./tools.sh hello world')
"

# -----------------------------------------------------------------------------

function func_hello() {
  local subject=${1:-}
  echo hello "${subject}"
}

# -----------------------------------------------------------------------------

if [ -z "$*" ]
then
  echo "$__usage"
else
    if [ $1 == "--help" ] || [ $1 == "-h" ]
    then
        echo "$__usage"
    fi

    if [ $1 == "hello" ]
    then
      func_hello $2
    fi
fi

