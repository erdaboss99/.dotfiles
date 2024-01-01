local wezterm = require "wezterm"

local super_vim_keys_map = {
	s = utf8.char(0xAA), -- <CMD-s>
	b = utf8.char(0xAB), -- <CMD-b>
}

local function bind_super_key_to_vim(key)
	return {
		key = key,
		mods = "CMD",
		action = wezterm.action_callback(function(win, pane)
			local char = super_vim_keys_map[key]
			if char then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = {
						key = char,
						mods = nil,
					},
				}, pane)
			else
				win:perform_action({
					SendKey = {
						key = key,
						mods = "CMD",
					},
				}, pane)
			end
		end),
	}
end

return {
	color_scheme = "Catppuccin Mocha",
	enable_tab_bar = false,
	font_size = 20.0,
	font = wezterm.font_with_fallback {
		{
			family = "JetBrains Mono",
		},
		{
			family = "JetBrainsMono Nerd Font",
		},
	},
	font_rules = {
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font_with_fallback {
				{
					family = "JetBrains Mono",
					weight = "Bold",
				},
				{
					family = "JetBrainsMono Nerd Font",
					weight = "Bold",
				},
			},
		},
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font_with_fallback {
				{
					family = "JetBrains Mono",
					italic = true,
				},
				{
					family = "JetBrainsMono Nerd Font",
					italic = true,
				},
			},
		},
		{
			intensity = "Bold",
			italic = true,
			font = wezterm.font_with_fallback {
				{
					family = "JetBrains Mono",
					italic = true,
					weight = "Bold",
				},
				{
					family = "JetBrainsMono Nerd Font",
					italic = true,
					weight = "Bold",
				},
			},
		},
	},
	use_cap_height_to_scale_fallback_fonts = true,

	macos_window_background_blur = 10,
	window_background_opacity = 0.7,
	window_decorations = "RESIZE",
	window_padding = {
		left = 1,
		right = 1,
		top = 1,
		bottom = 1,
	},
	exit_behavior = "CloseOnCleanExit",
	window_close_confirmation = "NeverPrompt",

	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = {
				Up = {
					streak = 1,
					button = "Left",
				},
			},
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	use_dead_keys = false,

	keys = {
		bind_super_key_to_vim "s",
		bind_super_key_to_vim "b",
		{ key = "/", mods = "CTRL", action = wezterm.action { SendString = "\x1f" } },
	},
}
