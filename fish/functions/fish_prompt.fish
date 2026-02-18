function fish_prompt
    set_color green
    printf ' %s' (prompt_pwd)
    set_color cyan
    printf ' > '
    set_color normal
    printf ''
end
