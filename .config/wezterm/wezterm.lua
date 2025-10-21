local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.front_end = 'WebGpu'
config.animation_fps = 10

config.audible_bell = 'Disabled'

-- Window "style"
config.window_background_opacity = 1.0
config.color_scheme = 'Catppuccin Mocha'

-- Cursor
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
-- Set to 0 to disable blinking, in case it turns out to be too battery-hungry
config.cursor_blink_rate = 500

-- Font
config.font_size = 14.0
config.font = wezterm.font {
    family = 'Menlo' ,
    weight = 'Medium',
} 

-- Tab bar
config.use_fancy_tab_bar = false

-- wezterm.on(
--     'format-tab-title',
--     function(tab, tabs, panes, config, hover, max_width)
--         return {
--             {Text = ' ' .. tab.active_pane.current_working_dir.file_path .. ' '}
--         }
--     end
-- )

-- Keybindings
local act = wezterm.action
config.keys = {
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = act.ActivateTabRelative(1)
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = act.ActivateTabRelative(-1)
    }
}

return config

