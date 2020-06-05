function cfed
    find $XDG_CONFIG_HOME -type d \( -path "$XDG_CONFIG_HOME/yarn/**" -o -path "$XDG_CONFIG_HOME/Microsoft**" \) -prune -o -type f -print | fzf | xargs -o $EDITOR 
end
