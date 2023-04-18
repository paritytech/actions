#!/usr/bin/env bash

shopt -s expand_aliases
VOL=/data
alias rs="docker run --rm -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_REGION -e AWS_BUCKET -v $PWD:$VOL $IMAGE"
alias awscli="docker run --rm  -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_REGION -e AWS_BUCKET -e AWS_CONFIG_FILE paritytech/awscli"

echoerr() { echo "$@" 1>&2; }

# Check if the mode is one of the supported ones
validate_mode() {
    case $1 in
        standard|gha)
        # release)
        return 0
        ;;

        *)
        return 1
        ;;

    esac
    return 1
}

# Check if the mode is valid and if we have all
# the ENV required for it
check_mode_inputs () {
    MODE=$1
    [[ -z "$MODE" ]] && { echoerr "The mode is mandatory"; return 1; }

    validate_mode "${MODE}"
    if [[ $? -ne 0 ]]; then
        echoerr "Invalid mode: $MODE"
        return 1
    fi

    case $MODE in
        standard)
            [[ -z $PRODUCT ]] && { echoerr "Missing ENV: PRODUCT"; return 1; }
            [[ -z $TAG ]] && { echoerr "Missing ENV: TAG"; return 1; }
            # [[ -z $ARCH ]] && { echoerr "Missing ENV: ARCH"; return 1; }
            return 0
        ;;

        *)
            echoerr "unreachable case"
            return 1
        ;;
    esac

    echoerr "unreachable"
    return 1
}

# Call ls on the S3 bucket to check for content
check_s3 () {
    # TODO: we don't want to see ALL
    # echo "Check: https://${AWS_BUCKET}.s3.${AWS_DEFAULT_REGION}.amazonaws.com/index.html"
    awscli aws s3 ls ${AWS_BUCKET} --summarize
    awscli aws s3 ls ${AWS_BUCKET}/${PRODUCT} --human-readable --recursive
}

show_versions () {
    echo "Running rs image version: $(rs version)"
    echo "Running awscli image version: $(awscli aws --version)"
}

main() {
    echo "TODO"
}
