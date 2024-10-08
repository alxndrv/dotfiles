# TODO: Write some actually useful things here

set fish_greeting ""

# Colors
set -U fish_color_normal normal
set -U fish_color_command 859900
set -U fish_color_quote b58900
set -U fish_color_redirection 6c71c4
set -U fish_color_end 2aa198
set -U fish_color_error dc322f
set -U fish_color_param 839496
set -U fish_color_comment 586e75
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=black
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 657b83
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion B3A06D
set -U fish_pager_color_description B3A06D
set -U fish_pager_color_prefix cyan --underline
set -U fish_pager_color_progress brwhite --background=cyan

export EDITOR='nvim'

set -U SXHKD_SHELL /usr/bin/bash
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config

source ~/.config/shell/aliases
source ~/.config/fish/local.fish
