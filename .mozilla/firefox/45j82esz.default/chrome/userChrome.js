// from https://github.com/mr-islam/zen-fox/blob/master/zenfox.js
//theming
var base03 =  "#002b36";
var base02 =  "#073642";
var base01 =  "#586e75";
var base00 =  "#657b83";
var base0 =   "#839496";
var base1 =   "#93a1a1";
var base2 =   "#eee8d5";
var base3 =   "#fdf6e3";
var yellow =  "#b58900";
var orange =  "#cb4b16";
var red =     "#dc322f";
var magenta = "#d33682";
var violet =  "#6c71c4";
var blue =    "#268bd2";
var cyan =    "#2aa198";
var green =   "#859900";

const themes = {
  'light': {
    colors: {
      "accentcolor": base2,
      "textcolor": base01,
      "toolbar": base3,
      "toolbar_text": base00,
      "toolbar_field": base2,
      "toolbar_field_text": base01,
      "tab_line": magenta,
      "popup": base2,
      "popup_text": base01,
      "tab_loading": magenta,
      "icons": base00,
      "icons_attention": magenta,
      "toolbar_field_separator": base1,
      "toolbar_vertical_separator": base1,
      "button_background_active": base2,
      "button_background_hover": base2,
      "ntp_background": base2,
      "ntp_text": base01,
      "popup_border": magenta,
      "popup_highlight": magenta,
      "sidebar": base3,
      "sidebar_highlight": base2, 
      "sidebar_highlight_text": magenta, 
      "sidebar_text": base00,
      "toolbar_field_border_focus": magenta,
      "toolbar_top_separator": base1,
      "toolbar_bottom_separator": base1,
      "toolbar_field_border": base1,
      "tab_text": magenta
    },
  },
  'dark': {
    colors: {
      "accentcolor": base03,
      "textcolor": base1,
      "toolbar": base02,
      "toolbar_text": base0,
      "toolbar_field": base03,
      "toolbar_field_text": base1,
      "tab_line": cyan,
      "popup": base03,
      "popup_text": base1,
      "tab_loading": cyan,
      "icons": base0,
      "icons_attention": cyan,
      "toolbar_vertical_separator": base01,
      "toolbar_field_separator": base01,
      "button_background_active": base03,
      "button_background_hover": base03,
      "ntp_background": base02,
      "ntp_text": base1,
      "popup_border": cyan,
      "popup_highlight": cyan,
      "sidebar": base03,
      "sidebar_highlight": base02, 
      "sidebar_highlight_text": cyan, 
      "sidebar_text": base0,
      "toolbar_field_border_focus": cyan,
      "toolbar_top_separator": base01,
      "toolbar_bottom_separator": base01,
      "toolbar_field_border": base01,
      "tab_text": cyan
    },
  }
};

function setTheme(theme) {
  browser.storage.local.set({'currentTheme': theme});
  browser.theme.update(themes[theme]);
  console.log('theme:' + theme + 'applied');
}

/////////////////////////////ACTUAL WORK/////////////////////////////////////

async function openSettings() {
  let initializedCheck = await browser.storage.local.get("initialized");
  let initializedCheckProp = initializedCheck["initialized"];

  if (initializedCheckProp != "yes") {
    browser.runtime.openOptionsPage();
  } 
  browser.storage.local.set({"initialized": "yes"});
  console.log('---openSettingsRun');
}

async function methodHandler() {
  console.log("--->method handler called");
  const method = await browser.storage.local.get("method");

  const methodProp = method["method"] || "manual";
  console.log('method: '+methodProp);

  if (methodProp == "manual") {
    const currentTheme = await browser.storage.local.get("currentTheme"); 
    const currentThemeProp = currentTheme["currentTheme"]; //repeated from above… but too annoying

    console.log("manual method selected");
    browser.browserAction.setTitle({title: "Zen Fox: Manual"});
    browser.browserAction.onClicked.removeListener(openSettings); //otherwise, it would do both
    browser.browserAction.onClicked.addListener(manualMethod);
    //meant for browser startup, sets last used theme:
    switch (currentThemeProp) {
      case 'light':
        setTheme('light');
        break;
      default:
      case 'dark':
        setTheme('dark');
        break;
    };
  }
}

function apply() {
  console.log('---started apply');
  accentHandler();
  methodHandler();
}

apply();
browser.runtime.onMessage.addListener(apply);
setTheme('light')
