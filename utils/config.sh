function set_var_if_empty {
    var_name="$1"
    var_value="${!var_name}"

    if [[ -z "$var_value" ]]; then
        read -r -p "provide a value for variable $var_name: " var_value
    fi

    if [[ -n "$var_value" ]]; then
        cp "$secrets" "$secrets.tmp"
        sed -i.bak "/^$var_name=\"/c\\$var_name=\"$var_value\"\\" "$secrets.tmp"
        rm "$secrets.tmp.bak"
        mv "$secrets.tmp" "$secrets"
        export "$var_name"="$var_value"
    else
        echo "invalid input for variable $var_name"
    fi
}

function init_vars {
    for var_name in "${@}"; do
        set_var_if_empty "$var_name"
    done
}