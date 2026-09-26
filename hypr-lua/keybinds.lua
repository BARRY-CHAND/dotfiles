--Keybinds
local scrPath = "~/.config/hypr/Scripts"
local mainMod = "SUPER"
local ipc     = "noctalia msg"

-- 1. Applications
local terminal = "kitty"
local editor   = "zeditor"
local explorer = "nautilus"
local browser  = "zen-browser"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal), { description = "Terminal" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(explorer), { description = "File Manager" })
hl.bind(mainMod .. " + CTRL + C", hl.dsp.exec_cmd(editor), { description = "VS Code" })
hl.bind(mainMod .. " + CTRL + Z", hl.dsp.exec_cmd(browser), { description = "Browser" })
hl.bind(mainMod .. " + CTRL + G", hl.dsp.exec_cmd("steam"))

-- 2. Noctalia
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"), { description = "Launcher" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(ipc .. " session lock"), { description = "Lockscreen" })
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(ipc .. " settings-toggle"), { description = "Settings" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"), { description = "Control Center" })
-- Noctalia v4 (Quickshell) plugin IPC, not valid in v5:
-- hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:keybind-cheatsheet toggle"), { description = "Keyhints Cheatsheet" })
-- hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:hyprland-keybinds toggle"), { description = "Keybind Editor" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(ipc .. " panel-toggle session"), { description = "Session Menu" })

-- 3. Window Management
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close Windows" })
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Floating" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), { description = "Toggle Fullscreen" })
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "m+1" }), { description = "Workspace Up" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "m-1" }), { description = "Workspace Down" })
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }), { description = "Focus Left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Focus Right" })
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }), { description = "Focus Up" })
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }), { description = "Focus Down" })
hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { description = "Cycle Focus" })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { description = "Resize Right" })
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { description = "Resize Left" })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { description = "Resize Up" })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { description = "Resize Down" })

-- Floating windows move by 30px, tiled windows swap in that direction
local function move_window(direction, x, y)
    return function()
        local w = hl.get_active_window()
        if w ~= nil and w.floating then
            hl.dispatch(hl.dsp.window.move({ x = x, y = y, relative = true }))
        else
            hl.dispatch(hl.dsp.window.move({ direction = direction }))
        end
    end
end
hl.bind(mainMod .. " + SHIFT + CTRL + left", move_window("l", -30, 0), { description = "Move Window Left" })
hl.bind(mainMod .. " + SHIFT + CTRL + right", move_window("r", 30, 0), { description = "Move Window Right" })
hl.bind(mainMod .. " + SHIFT + CTRL + up", move_window("u", 0, -30), { description = "Move Window Up" })
hl.bind(mainMod .. " + SHIFT + CTRL + down", move_window("d", 0, 30), { description = "Move Window Down" })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move Window (Mouse)" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize Window (Mouse)" })
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), { mouse = true, description = "Move Window (Key)" })
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), { mouse = true, description = "Resize Window (Key)" })

-- 4. Screen Capture
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m window"), { description = "Screenshot-Window" })
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m output"), { description = "Screenshot-Screen" })
-- $shiftMod was never defined in the .conf, so SHIFT is assumed here
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("HYPRSHOT_DIR=~/Pictures/Screenshots hyprshot -m region"), { description = "Screenshot-Region" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | satty --filename - --output-filename ~/Pictures/Screenshots/Screenshot-$(date '+%Y%m%d-%H:%M:%S').png]]), { description = "Screenshot-Region w/ Editor" })

-- 5. Workspaces
-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move to Workspace " .. i })
end

hl.bind(mainMod .. " + CTRL + right", hl.dsp.focus({ workspace = "r+1" }), { description = "Next Workspace" })
hl.bind(mainMod .. " + CTRL + left", hl.dsp.focus({ workspace = "r-1" }), { description = "Previous Workspace" })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.focus({ workspace = "empty" }), { description = "Nearest Empty Workspace" })
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll Workspace Forward" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll Workspace Backward" })
hl.bind(mainMod .. " + CTRL + ALT + right", hl.dsp.window.move({ workspace = "r+1" }), { description = "Move to Next Relative Workspace" })
hl.bind(mainMod .. " + CTRL + ALT + left", hl.dsp.window.move({ workspace = "r-1" }), { description = "Move to Previous Relative Workspace" })

-- 6. HARDWARE CONTROLS
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/Pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Next Track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous Track" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { description = "Volume Up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { description = "Volume Down" })

-- 7. BRIGHTNESS
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- 8. VOLUME
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- 9. Auto Rotate
hl.bind(mainMod .. " + ALT + O", hl.dsp.exec_cmd(scrPath .. "/rotate-screen.sh"))
