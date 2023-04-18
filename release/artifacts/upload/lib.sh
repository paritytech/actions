#!/usr/bin/env bash

check_mode_inputs () {
    MODE=$1
    [ -z "$MODE" ] && echo "The mode is mandatory"; return 1

    echo "Checking mode $MODE"

    echo "Not implemented yet"
    return 1
}
