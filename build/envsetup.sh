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
