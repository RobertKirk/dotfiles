-- Laptop/Desktop Mode{{{
laptopMode = #hs.screen.allScreens() == 1

if laptopMode then
  hyper_mods = {}
  hyper_key = 90
else
  hyper_mods = {}
  hyper_key = 113
end

-- }}}
-- App Launching/switching{{{
hs.loadSpoon("AppLauncher")
--
-- hyper_config = {
--   a = "Calendar (Google)", - bundleID = 'com.google.calendar',
--   b = "Zotero", - bundleID = 'org.zotero.Zotero',
--   g = "Google Chrome", - bundleID = 'com.google.Chrome',
--   m = "Spotify", - bundleID = 'com.spotify.client',
--   n = "Notion", - bundleID = 'notion.id',
--   r = "Roam Research", - bundleID = 'com.roamresearch.roamresearch',
--   s = "Skim", - bundleID = 'net.sourceforge.skim-app.skim',
--   t = "Alacritty", - bundleID = 'io.alacritty',
--   z = "zoom.us", - bundleID = 'us.zoom.xos',
-- }

-- spoon.AppLauncher.modifiers = two_modifiers
-- spoon.AppLauncher:bindHotkeys(mapping)

config = {}
config.applications = {
  ['org.alacritty'] = {
    bundleID = 'org.alacritty',
    hyper_key = 't',
  },
  ['com.spotify.client'] = {
    bundleID = 'com.spotify.client',
    hyper_key = 'm'
  },
  ['net.sourceforge.skim-app.skim'] = {
    bundleID = 'net.sourceforge.skim-app.skim',
    hyper_key = 's',
  },
  ['com.google.Chrome'] = {
    bundleID = 'com.google.Chrome',
    hyper_key = 'g',
  },
  ['com.google.calendar'] = {
    bundleID = 'com.Calendar_(Google)',
    hyper_key = 'a',
  },
  ['org.zotero.Zotero'] = {
    bundleID = 'org.zotero.zotero',
    hyper_key = 'b',
  },
  ['notion.id'] = {
    bundleID = 'notion.id',
    hyper_key = 'n',
  },
  ['com.roam-research.desktop-app'] = {
    bundleID = 'com.roam-research.desktop-app',
    hyper_key = 'r',
  },
  ['us.zoom.xos'] = {
    bundleID = 'us.zoom.xos',
    hyper_key = 'z',
  },
  ['design.yugen.flow'] = {
    bundleID = 'design.yugen.flow',
    hyper_key = 'f',
  },
  ['screenshot'] = {
    task = "/usr/sbin/screencapture",
    arg1 = nil,
    arg2 = {"-ic"},
    hyper_key = 'p',
  }
}
config.hyper_key = hyper_key

hyper = require('hyper')
hyper.start(config)

hyper:bind({"cmd"}, 'f', function()
  hs.osascript("tell application \"Flow\" to show")
end)
hyper:bind({}, 'tab', function()
  hs.osascript("tell application \"Flow\" to skip")
end)
hyper:bind({"shift"}, 'tab', function()
  hs.osascript("tell application \"Flow\" to previous")
end)

-- function currentAppFilter (window)
--   return window:application():name() == hs.application.frontmostApplication():name()
-- end

-- currrentAppSwitcher = hs.window.switcher.new(hs.window.filter.new(currentAppFilter))
-- basicSwitcher = hs.window.switcher.new()

-- hs.hotkey.bind('cmd','`','Next window',function()basicSwitcher:next()end)
-- hs.hotkey.bind('cmd-shift','`','Prev window',function()basicSwitcher:previous()end)

-- }}}
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
hyper:bind({"cmd"}, "r", function()
  hs.reload()
end)
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config Reloaded")
-- }}}
-- Finding Screens {{{

laptopScreen = 'Built-in Retina Display'
mainScreen = hs.screen.primaryScreen():name() -- 'HP V28 4K', or 'DELL P3222QE'
secondScreen = 'DELL U2715H'
if not hs.screen(secondScreen) then
  secondScreen = 'DELL U2414H'
end
if not hs.screen(secondScreen) then
  secondScreen = 'DELL P3222QE (1)'
end

-- }}}
-- Scrolling for Volume{{{
hs.loadSpoon("VolumeScroll")

spoon.VolumeScroll:init()
spoon.VolumeScroll:start({"cmd"})

-- }}}
-- MouseCircle{{{
hs.loadSpoon("MouseCircle")

hyper:bind({"cmd"}, "m", function()
  spoon.MouseCircle:show()
end)

-- }}}
-- Clipboard {{{

hs.loadSpoon("TextClipboardHistory")
spoon.TextClipboardHistory:start()

hyper:bind({}, "C", function()
  spoon.TextClipboardHistory:toggleClipboard()
end)

-- }}}
-- Layouts {{{

allLayouts = {}

allLayouts['default'] = {
  {'Alacritty', nil, mainScreen, hs.layout.maximized, nil, nil},
  {'Roam Research', nil, mainScreen, hs.layout.maximized, nil, nil},
  {'Skim', nil, secondScreen, hs.layout.maximized, nil, nil},
  {'Google Chrome', nil, secondScreen, hs.layout.maximized, nil, nil},
  {'Spotify', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Zotero', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Calendar (Google)', nil, laptopScreen, hs.layout.maximized, nil, nil},
}

allLayouts['one_screen'] = {
  {'Calendar (Google)', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Google Chrome', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Alacritty', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Spotify', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Skim', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Zotero', nil, laptopScreen, hs.layout.maximized, nil, nil},
  {'Roam Research', nil, laptopScreen, hs.layout.maximized, nil, nil},
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

hyper:bind({"shift"}, "l", applyLayout)

-- }}}
-- Window arrangement{{{
--
-- Left Half
hyper:bind({}, "H", function()
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
hyper:bind({}, "L", function()
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
hyper:bind({}, "K", function()
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
hyper:bind({}, "J", function()
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
  hyper:bind({"cmd"}, 'h', function() spoon.WindowScreenLeftAndRight:oneScreenLeft() end)
  hyper:bind({"cmd"}, 'l', function() spoon.WindowScreenLeftAndRight:oneScreenRight() end)
end
---}}}
-- KSheet{{{
hs.loadSpoon("KSheet")
hyper:bind({}, "v", function()
  spoon.KSheet:toggle()
end)
-- spoon.KSheet:bindHotkeys({toggle = {{"cmd", "alt", "shift"}, "K"}})

-- }}}
-- HSearch{{{
hs.loadSpoon("HSearch")

hyper:bind({}, "u", function()
  spoon.HSearch:toggleShow()
end)

-- }}}
-- vim:foldmethod=marker:foldlevel=0
