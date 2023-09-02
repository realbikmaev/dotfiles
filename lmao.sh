#!/usr/bin/env bash
set -eu

self="$0"
echo "$self"

a=""
b=""
c=""

function set_var_if_empty {
    var_name="$1"
    var_value="${!var_name}"

    if [[ -z "$var_value" ]]; then
        read -r -p "Provide a value for variable $var_name: " var_value
    fi

    if [[ -n "$var_value" ]]; then
        cp "$self" "$self.tmp"
        sed -i.bak "/^$var_name=\"/c\\
$var_name=\"$var_value\"\\
" "$self.tmp"
        rm "$self.tmp.bak"
        mv "$self.tmp" "$self"
        export "$var_name"="$var_value"
    else
        echo "Invalid input for variable $var_name"
    fi
}

function init_vars {
    for var_name in "${@}"; do
        set_var_if_empty "$var_name"
    done
}

vars=("a" "b" "c")

init_vars "${vars[@]}"

echo "$a"
echo "$b"
echo "$c"
