-- Utilities {{{
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
 end


function serializeTable(val, name, skipnewlines, depth)
    skipnewlines = skipnewlines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)

    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

        for k, v in pairs(val) do
            tmp =  tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
        end

        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[unserializeable datatype:" .. type(val) .. "]\""
    end

    -- print(tmp)
    return tmp
end
-- }}}
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

if laptopMode then
  two_modifiers = {"option", "cmd"}
else
  two_modifiers = {"ctrl", "cmd"}
end

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
  s = "Skim",
  z = "zoom.us",
  a = "Calendar (Google)",
  n = "Notion",
  b = "Zotero",
  p = "Screenshot",
}

spoon.AppLauncher.modifiers = two_modifiers

spoon.AppLauncher:bindHotkeys(mapping)

-- }}}
-- Clipboard {{{

hs.loadSpoon("TextClipboardHistory")
spoon.TextClipboardHistory:start()

hs.hotkey.bind(two_modifiers, "C", function()
  spoon.TextClipboardHistory:toggleClipboard()
end)

-- }}}
-- Layouts {{{

allLayouts = {}

allLayouts['default'] = {
  {'Calendar (Google)', nil, 'Built-in Retina Display', hs.layout.maximized, nil, nil},
  {'Google Chrome', nil, 'DELL U2715H', hs.layout.maximized, nil, nil},
  {'Alacritty', nil, 'HP V28 4K', hs.layout.maximized, nil, nil},
  {'Spotify', nil, 'Built-in Retina Display', hs.layout.maximized, nil, nil},
  {'Skim', nil, 'DELL U2715H', hs.layout.maximized, nil, nil},
  {'Roam Research', nil, 'HP V28 4K', hs.layout.maximized, nil, nil},
}

allLayouts['one_screen'] = {
  {'Calendar (Google)', nil, 'Built-in Retina Display', hs.layout.maximized, nil, nil},
  {'Google Chrome', nil, 'Built-in Retina Deisplay', hs.layout.maximized, nil, nil},
  {'Alacritty', nil, 'Built-in Retina Deisplay', hs.layout.maximized, nil, nil},
  {'Spotify', nil, 'Built-in Retina Display', hs.layout.maximized, nil, nil},
  {'Skim', nil, 'Built-in Retina Deisplay', hs.layout.maximized, nil, nil},
  {'Roam Research', nil, 'Built-in Retina Deisplay', hs.layout.maximized, nil, nil},
}

function saveLayout ()
  all_windows = hs.window.allWindows()
  saved_layout = {}
  for i, window in pairs(all_windows) do
    print(window:application():name(), window:screen():name(), window:frame()) 
    table.insert(
      saved_layout,
      {window:application():name(), nil, window:screen():name(), window:frame():toUnitRect(window:screen():frame()), nil, nil}
    )
  end
  table.insert(allLayouts, saved_layout)
  return saved_layout
end

layoutChooser = hs.chooser.new(function(i)
    print("layout chooser", i)
    hs.layout.apply(allLayouts[i["uuid"]])
  end
)

function getLayouts()
  choices = {}
  for i, layout in pairs(allLayouts) do
    choice = {}
    choice["text"] = "Name: " .. i .. ". Layout: " .. dump(layout)
    choice["uuid"] = i
    table.insert(choices, choice)
  end
  print(dump(choices))
  return choices
end

layoutChooser:choices(getLayouts)

function applyLayout ()
  layoutChooser:show()
end

hs.hotkey.bind({"cmd", "alt", "shift"}, "L", applyLayout)

-- }}}
-- Window arrangement{{{
--
-- Left Half
hs.hotkey.bind(two_modifiers, "H", function()
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
hs.hotkey.bind(two_modifiers, "L", function()
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
hs.hotkey.bind(two_modifiers, "K", function()
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
hs.hotkey.bind(two_modifiers, "J", function()
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
