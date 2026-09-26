-- Source Files
require("monitors")
require("startup")
require("inputs")
require("keybinds")
require("windowrules")
require("animations")
require("themes.theme")

-- Noctalia colors and HyprMod (were loaded by the old hyprland.lua, uncomment to use them again)
-- require("hyprland-gui")


-- Layouts
-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true,
    },
})

-- See https://wiki.hyprland.org/Configuring/Master-Layout/
hl.config({
    master = {
        new_status = "master",
    },
})


-- Misc
-- See https://wiki.hyprland.org/Configuring/Variables/#misc
hl.config({
    misc = {
        vrr = 0,                         -- 0=OFF 1=ON 2=FULLSCREEN ONLY
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        anr_missed_pings = 5,
        allow_session_lock_restore = true,
    },
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.config({
    general = {
        snap = {                         -- snapping for floating windows
            enabled = true,
        },
    },
})


