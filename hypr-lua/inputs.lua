--INPUTS

hl.config({
    input = {
        -- Keyboard: Add a layout and uncomment kb_options for Win+Space switching shortcut
        kb_layout = "us",
        -- kb_options = "grp:win_space_toggle",
        numlock_by_default = true,
        repeat_delay = 250,
        repeat_rate = 35,
        accel_profile = "flat",
        sensitivity = 0.5,

        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            scroll_factor = 0.8,
        },
        special_fallthrough = true,
        follow_mouse = 1,
    },
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "pinchin", action = "float", mode = "tile" })
hl.gesture({ fingers = 3, direction = "pinchout", action = "float", mode = "float" })
