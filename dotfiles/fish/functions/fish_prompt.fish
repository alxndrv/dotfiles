function fish_prompt
    printf '%s%s%s:%s%s/%s$ ' (set_color green) "$USER" (set_color normal) (set_color blue) (prompt_pwd) (set_color normal)
end
