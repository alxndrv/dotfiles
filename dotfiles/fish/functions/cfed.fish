function cfed
    find ~/.config | fzf | xargs -o $EDITOR 
end
