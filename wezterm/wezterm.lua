local wezterm = require('wezterm')
local act = wezterm.action
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()

local config = {}

config.colors = colors
window_frame.font_size = 14.0

config.inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.8,
}
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = window_frame


config.keys = {
    {
        key = 'd',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'v',
        mods = 'SUPER|SHIFT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = "H",
        mods = "SUPER|SHIFT",
        action = act.AdjustPaneSize({ "Left", 5 })
    },
    {
        key = "L",
        mods = "SUPER|SHIFT",
        action = act.AdjustPaneSize({ "Right", 5 })
    },
    {
        key = "K",
        mods = "SUPER|SHIFT",
        action = act.AdjustPaneSize({ "Up", 2 })
    },
    {
        key = "J",
        mods = "SUPER|SHIFT",
        action = act.AdjustPaneSize({ "Down", 2 })
    }
}


return config
