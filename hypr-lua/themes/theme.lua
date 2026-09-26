--SYSTEMWIDE CURSOR (Change to your theme)
hl.env("HYPRCURSOR_THEME", "McMojave-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "McMojave-cursors")
hl.env("XCURSOR_SIZE", "24")
hl.env("QT_CURSOR_THEME", "McMojave-cursors")
hl.env("QT_CURSOR_SIZE", "24")


hl.config({
    general = {
        gaps_in = 8,

        gaps_out = 6,

        border_size = 4,

        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border   = "rgba(B08D57ff)",-- rgba(5E81ACff) 45deg
            inactive_border = { colors = { "rgba(070722cc)", "rgba(070722cc)" }, angle = 45 },
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },
})


hl.config({
    group = {
        col = {
            border_active          = { colors = { "rgba(5E81ACff)" }, angle = 45 },
            border_inactive        = { colors = { "rgba(070722cc)", "rgba(070722cc)" }, angle = 45 },
            border_locked_active   = { colors = { "rgba(21215fff)", "rgba(21215fff)" }, angle = 45 },
            border_locked_inactive = { colors = { "rgba(070722cc)", "rgba(070722cc)" }, angle = 45 },
        },
    },
})

hl.config({
    decoration = {
        rounding = 0,
        shadow = {
            enabled = true,
        },
        active_opacity = 1.0,
        inactive_opacity = 0.90,
        fullscreen_opacity = 1.0,


        blur = {
            enabled = true,
            size = 1,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
            special = true,
        },
    },
})
