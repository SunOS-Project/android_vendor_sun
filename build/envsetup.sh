function __print_sun_functions_help() {
cat <<EOF
Additional SunOS functions:
- clodiff:         Utility to diff CLO history to AOSPA.
- clomerge:        Utility to merge CLO tags.
EOF
}

function clodiff()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/sun/build/tools/diff-clo.py $target_branch
}

function clomerge()
{
    target_branch=$1
    set_stuff_for_environment
    T=$(gettop)
    python3 $T/vendor/sun/build/tools/merge-clo.py $target_branch
}

function generate_host_overrides() {
    export BUILD_USERNAME=android-build
    HEX=$(openssl rand -hex 8)
    ALPHA=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 4 | head -n 1)
    export BUILD_HOSTNAME="r-${HEX}-${ALPHA}"
    echo "BUILD_USERNAME=$BUILD_USERNAME"
    echo "BUILD_HOSTNAME=$BUILD_HOSTNAME"
}

generate_host_overrides
