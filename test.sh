___x_cmd_yanfa_mod_ls_latest(){
    # ___x_cmd_curl_gitx modlist
    curl https://gitee.com/x-cmd/x-cmd/raw/main/modlist 2>/dev/null \
        | ___x_cmd_yanfa_mod_ls_awk_
    local code=$?
    echo $code
    return $code
}

___x_cmd_yanfa_mod_ls_awk_(){
    awk -v mode="${1:-all}" '
($0!="")&&($0 !~ /[ ]*#/){
    mod=$1
    gsub(/^\+/, "", mod)
    if (mode == "all") print mod
    else if (mode == "core") { if ($1 ~ /^\+/) print mod }
    else if (index(mode, mod) > 0) print mod
}'
}
___x_cmd_yanfa_mod_ls_latest
