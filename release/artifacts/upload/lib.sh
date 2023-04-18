#!/usr/bin/env bash

echoerr() { echo "$@" 1>&2; }

validate_mode() {
    case $1 in
        standard)
        #"standard")
        #"standard")
        return 0
        ;;

        *)
        return 1
        ;;

    esac
}

# Check if the mode is valid and if we have all
# the ENV required for it
check_mode_inputs () {
    MODE=$1
    if [[ -z "$MODE" ]]; then
        echoerr "The mode is mandatory"
        return 1
    fi

    if [[ $(validate_mode ${MODE}) -ne 0 ]]; then
        echoerr "Invalid mode: $MODE"
        return 1
    fi

    echo "Checking mode: $MODE"


    case $MODE in
        standard)
            [[ -z $PRODUCT ]] && { echoerr "Missing ENV: PRODUCT"; return 1; }
            [[ -z $TAG ]] && { echoerr "Missing ENV: TAG"; return 1; }
            # [[ -z $ARCH ]] && { echoerr "Missing ENV: ARCH"; return 1; }
            return 0
        ;;

        *)
            echoerr "unreachable"
            return 1
        ;;
    esac

    return 1
}
