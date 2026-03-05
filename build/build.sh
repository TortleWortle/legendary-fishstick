DIR=$(dirname $BASH_SOURCE)

# shellcheck source=/dev/null
find $DIR -type f -regex '/ctx/build/[0-9]+.*.sh' -exec {} \;
