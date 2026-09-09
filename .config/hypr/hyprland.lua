require("appearance")
local colors = require("colors")

------------------
---- MONITORS ----
------------------

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local appMenu     = "hyprlauncher"
local webBrowser  = "firefox"
local youtubeMusic = webBrowser .. " --new-window https://music.youtube.com/playlist?list=LM"
local classwork  = webBrowser .. " --new-window https://lms.protechskillsinstitute.org/"
local curseforge  = "~/.bin/curseforge.AppImage"
local battlenet   = "lutris lutris:rungame/battlenet"
local disc        = "discord"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function () 
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("systemctl --user start hyprland-session.target")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("waybar & hyprpaper")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
	-- make caps lock behave like ctrl, remove capslock altogether
	kb_options = "ctrl:nocaps",
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local altMod = "CTRL"

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0, action = "toggle" }))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + W", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(webBrowser))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(youtubeMusic))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(classwork))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(battlenet))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(curseforge))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(appMenu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + G", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L",  hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",  hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

-- Resize focused window
hl.bind(mainMod .. " + " .. altMod .. " + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + " .. altMod .. " + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + " .. altMod .. " + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + " .. altMod .. " + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
    local key = i
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- tilde workspace
hl.bind(mainMod .. " + GRAVE", hl.dsp.focus({ workspace = 10}))
hl.bind(mainMod .. " + SHIFT + GRAVE ", hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio control
-- volume up
hl.bind(mainMod .. " + " .. altMod .. " + F", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
-- volume down
hl.bind(mainMod .. " + " .. altMod .. " + D", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
-- volume mute
hl.bind(mainMod .. " + " .. altMod .. " + A", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind(mainMod .. " + " .. altMod .. " + A", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
-- play pause, next, prev
hl.bind(mainMod .. " + " .. altMod .. " + R", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = false })
hl.bind(mainMod .. " + " .. altMod .. " + E", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = false })
hl.bind(mainMod .. " + " .. altMod .. " + Q", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = false })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Screen brightness
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Screenshots
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- WoW windowrule
hl.window_rule({
    name = "world_of_warcraft",
    match = { title = "World of Warcraft" },
    content = "game",
    fullscreen = true,
    immediate = false,
    decorate = false,
    float = true,
    no_blur = true,
    border_size = 0,
    no_screen_share = true,
    no_dim = true,
    no_max_size = true,
    no_shadow = true,
    no_anim = true,
    workspace = 1,
})

-- Battle.net
hl.window_rule({
    match = { title = "Battle.net" },
    immediate = false,
    workspace = 2,
})

-- CurseForge
hl.window_rule({
    match = { class = "curseforge" },
    immediate = false,
    workspace = 2,
})

--
-- HOST BASED CUSTOMIZATIONS
--

-- acquire current hostname
local handle = io.popen("cat /etc/hostname") 
local hostname = handle:read("*a"):gsub("%s+", "") -- reads and removes whitespace
handle:close()

--
-- MY DESKTOP
--

if hostname == "bmPC" then

    -- WORKSPACES
    hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" }) -- top monitor dedicated workspace
    hl.workspace_rule({ workspace = "1", gaps_out = 0, gaps_in = 0 }) -- gaming workspace
    for i = 1, 9 do
        local key = i
    	hl.workspace_rule({ workspace = key, monitor = "DP-2" }) -- primary monitor
    end

    -- MONITORS 
    hl.monitor({ output = "DP-2", mode = "3440x1440@59.97Hz", position = "0x0", scale = 1 })
    hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@59.95Hz", position = "515x-1440", scale = 1 })

    -- LAUNCH APPS ON START
    hl.on("hyprland.start", function ()
      hl.exec_cmd(disc, { workspace = "10 silent" })
      hl.exec_cmd(youtubeMusic, { workspace = "10 silent" })
      hl.exec_cmd(battlenet, { workspace = "2 silent" })
      hl.exec_cmd(curseforge, { workspace = "2 silent" })
    end)

--
-- MY LAPTOP
--

elseif hostname == "bmTP" then

    -- MONITOR
    hl.monitor({ output = "eDP-1", mode = "1920x1080@60.05Hz", position = "0x0", scale = 1 })

    -- LAUNCH APPS ON START
    hl.on("hyprland.start", function ()
      hl.exec_cmd(disc, { workspace = "10 silent" })
      hl.exec_cmd(battlenet, { workspace = "3 silent" })
      hl.exec_cmd(curseforge, { workspace = "3 silent" })
      hl.exec_cmd(classwork, { workspace = "1 silent" })
    end)
end

