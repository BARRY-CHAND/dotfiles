--STARTUP

hl.on("hyprland.start", function()
    -- hl.exec_cmd("qs -c noctalia-shell")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("hyprctl reload &")
    hl.exec_cmd("~/.config/hypr/Scripts/autorotate.sh")
end)

--ENVIRONMENT VARIABLES
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

--Nvidia (Uncomment if using Nvidia GPU)
-- hl.env("WLR_NO_HARDWARE_CURSORS", "1")
-- hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("GBM_BACKEND", "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
-- hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("NVD_BACKEND", "direct")
-- hl.on("hyprland.start", function()
--     hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
--     hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
-- end)

--QT
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

--ELECTRON
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")


--EXEC-ONCE SERVICES
hl.on("hyprland.start", function()
    --Polkit (required)
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || /usr/libexec/polkit-gnome-authentication-agent-1")

    --GNOME Keyring (optional i.e Browser Passwords)
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")

    --Idle daemon
    hl.exec_cmd("hypridle &")
end)
