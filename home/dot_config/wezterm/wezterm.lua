-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
config.color_scheme = 'tokyonight'
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font = wezterm.font('JetBrainsMono Nerd Font Mono')

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  { key = '|', mods = 'LEADER|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{
		key = '-',
		mods = 'LEADER',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
	{
		key = 'LeftArrow',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = 'RightArrow',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = 'UpArrow',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = 'DownArrow',
		mods = 'ALT',
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{ key = 'LeftArrow', mods = 'SHIFT', action = wezterm.action.ActivateTabRelative(-1) },
	{ key = 'RightArrow', mods = 'SHIFT', action = wezterm.action.ActivateTabRelative(1) }, 
}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
		mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

-- Finally, return the configuration to wezterm:
return config

