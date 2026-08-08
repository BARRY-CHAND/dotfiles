---@diagnostic disable: undefined-global
---@module "hl"
-- ============================================================
-- KEYBINDS
-- ============================================================

-- ============================================================
-- DEFAULTS
-- ============================================================

local terminal = "kitty"
local explorer = "nautilus"
local browser = "zen-browser"
local editor = "zeditor"
local game = "steam"

-- ============================================================
-- APPLICATION BINDINGS
-- ============================================================

hl.bind("SUPER + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + E", hl.dsp.exec_cmd(explorer))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd(editor))
hl.bind("SUPER + SHIFT + Z", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(game))

-- ============================================================
-- NOCTALIA
-- ============================================================

hl.bind("SUPER + D", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call launcher toggle"))

hl.bind("SUPER + L", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))

hl.bind("SUPER + T", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call settings toggle"))

hl.bind("SUPER + O", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call controlCenter toggle"))

hl.bind("SUPER + H", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:keybind-cheatsheet toggle"))

hl.bind("SUPER + K", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:hyprland-keybinds toggle"))

-- ============================================================
-- WINDOW MANAGEMENT
-- ============================================================

-- Basic window actions

hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close Windows" })

hl.bind("SUPER + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Floating" })

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle" }), { description = "Toggle Fullscreen" })

-- ============================================================
-- WORKSPACE NAVIGATION
-- ============================================================

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "m+1" }), { description = "Workspace Up" })

hl.bind("SUPER + SHIFT + TAB", hl.dsp.focus({ workspace = "m-1" }), { description = "Workspace Down" })

-- ============================================================
-- FOCUS MOVEMENT
-- ============================================================

local focus_binds = {
	{
		key = "LEFT",
		direction = "l",
		description = "Focus Left",
	},
	{
		key = "RIGHT",
		direction = "r",
		description = "Focus Right",
	},
	{
		key = "UP",
		direction = "u",
		description = "Focus Up",
	},
	{
		key = "DOWN",
		direction = "d",
		description = "Focus Down",
	},
}

for _, bind in ipairs(focus_binds) do
	hl.bind("SUPER + " .. bind.key, hl.dsp.focus({ direction = bind.direction }), { description = bind.description })
end

-- ============================================================
-- CYCLE FOCUS
-- ============================================================

hl.bind("ALT + TAB", hl.dsp.layout("cyclenext"), { description = "Cycle Focus" })

-- ============================================================
-- RESIZE ACTIVE WINDOW
-- ============================================================

local resize_binds = {
	{
		key = "RIGHT",
		x = 30,
		y = 0,
		description = "Resize Right",
	},
	{
		key = "LEFT",
		x = -30,
		y = 0,
		description = "Resize Left",
	},
	{
		key = "UP",
		x = 0,
		y = -30,
		description = "Resize Up",
	},
	{
		key = "DOWN",
		x = 0,
		y = 30,
		description = "Resize Down",
	},
}

for _, bind in ipairs(resize_binds) do
	hl.bind(
		"SUPER + SHIFT + " .. bind.key,
		hl.dsp.window.resize({
			x = bind.x,
			y = bind.y,
			relative = true,
		}),
		{ description = bind.description }
	)
end

-- ============================================================
-- SCREEN CAPTURE
-- ============================================================

hl.bind(
	"SUPER + PRINT",
	hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m window"),
	{ description = "Screenshot-Window" }
)

hl.bind(
	"ALT + PRINT",
	hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m output"),
	{ description = "Screenshot-Screen" }
)

hl.bind(
	"SUPER + SHIFT + PRINT",
	hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m region"),
	{ description = "Screenshot-Region" }
)

hl.bind("SUPER + A", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | sat]]))

-- ============================================================
-- WORKSPACE MANAGEMENT
-- ============================================================

for i = 1, 10 do
	local key = i % 10

	-- Switch workspace
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }), { description = "Workspace " .. i })

	-- Move window to workspace
	hl.bind(
		"SUPER + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move Window to Workspace " .. i }
	)
end

-- Relative workspace movement

hl.bind("SUPER + CTRL + RIGHT", hl.dsp.focus({ workspace = "r+1" }), { description = "Next Workspace" })

hl.bind("SUPER + CTRL + LEFT", hl.dsp.focus({ workspace = "r-1" }), { description = "Previous Workspace" })

hl.bind("SUPER + CTRL + DOWN", hl.dsp.focus({ workspace = "empty" }), { description = "Nearest Empty Workspace" })

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll Workspace Forward" })

hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll Workspace Backward" })

-- Monitor-relative workspace movement

hl.bind("SUPER + CTRL + ALT + RIGHT", hl.dsp.focus({ workspace = "r+1" }))

hl.bind("SUPER + CTRL + ALT + LEFT", hl.dsp.focus({ workspace = "r-1" }))

-- ============================================================
-- HARDWARE CONTROLS
-- ============================================================

local media_binds = {
	{
		key = "XF86AudioPlay",
		command = "playerctl play-pause",
	},
	{
		key = "XF86AudioNext",
		command = "playerctl next",
	},
	{
		key = "XF86AudioPrev",
		command = "playerctl previous",
	},
	{
		key = "XF86AudioRaiseVolume",
		command = "pamixer -i 5",
	},
	{
		key = "XF86AudioLowerVolume",
		command = "pamixer -d 5",
	},
}

for _, bind in ipairs(media_binds) do
	hl.bind(bind.key, hl.dsp.exec_cmd(bind.command))
end

-- ============================================================
-- BRIGHTNESS
-- ============================================================

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))

-- ============================================================
-- VOLUME
-- ============================================================

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- ============================================================
-- AUTO ROTATE
-- ============================================================

hl.bind("SUPER + ALT + O", hl.dsp.exec_cmd("~/.config/hypr/Scripts/auto-rotate"))
