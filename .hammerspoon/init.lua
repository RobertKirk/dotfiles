-- Config Reloading{{{
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", function()
  hs.reload()
end)
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config Reloaded")
-- }}}
-- Laptop/Desktop Mode{{{
laptopMode = #hs.screen.allScreens() == 1

-- }}}
-- Scrolling for Volume{{{
hs.loadSpoon("VolumeScroll")

spoon.VolumeScroll:init()
spoon.VolumeScroll:start({"cmd"})

-- }}}
-- App Launching/switching{{{
hs.loadSpoon("AppLauncher")

mapping = {
  g = "Google Chrome",
  t = "Alacritty",
  m = "Spotify",
  r = "Roam Research",
  s = "Skim"
}

spoon.AppLauncher.modifiers = {"ctrl", "cmd"}

spoon.AppLauncher:bindHotkeys(mapping)

-- }}}
-- Clipboard {{{

hs.loadSpoon("TextClipboardHistory")
spoon.TextClipboardHistory:start()

hs.hotkey.bind({"cmd", "ctrl"}, "C", function()
  spoon.TextClipboardHistory:toggleClipboard()
end)

-- }}}
-- Window arrangement{{{
-- Left Half
hs.hotkey.bind({"cmd", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Right Half
hs.hotkey.bind({"cmd", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w /2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Maximise
hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Small Centred
hs.hotkey.bind({"cmd", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w /4)
  f.y = max.y + (max.h /4)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Moving left and right screens (no point when in laptop mode)
if not laptopMode then
  hs.loadSpoon("WindowScreenLeftAndRight")
  spoon.WindowScreenLeftAndRight:bindHotkeys({
        screen_left  = { {"cmd", "ctrl", "shift"}, "H"},
        screen_right  = { {"cmd", "ctrl", "shift"}, "L"}
  })
end
---}}}
-- vim:foldmethod=marker:foldlevel=0
