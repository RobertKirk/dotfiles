// Lots of it is inspired by https://github.com/alswl/.oOo./blob/master/.surfingkeys.js

settings.hintAlign = "left";

settings.blacklistPattern = /https?:\/\/((roamresearch.com)|(mail.google.com)|(calendar.google.com)|(localhost:8888))\/*/

map('<Ctrl-z>', '<Alt-i>')  // ignore mode (escape to exit)

map('K', 'E');  // tab focus left
map('J', 'R');  // tab focus right

map('H', 'B');  // back in history
map('L', 'F');  // forward in history

map('F', 'gf');  // open link in new tab without focus

map('p', '<Alt-p>');  // pin tab (toggle)
map('m', '<Alt-m>');  // mute tab (toggle)

map('d', 'x');  // restore closed tab
map('u', '<Alt-p>');  // tab focus right

mapkey('gi', '#1Go to edit box', function() {
    var inputs = document.getElementsByTagName('input');
    var input = null;
    for(var i=0; i<inputs.length; i++) {
        if(inputs[i].type=='text') {
            input = inputs[i];
            break;
        }
    }
    if(input) {
        input.click();
        input.focus();
    }
});

mapkey('p', "Open the clipboard's URL in the current tab", function() {
    navigator.clipboard.readText().then(
        text => {
            if (text.startsWith("http://") || text.startsWith("https://")) {
                window.location = text;
            } else {
                window.location = text = "https://www.google.com/search?q=" + text;
            }
        }
    );
});

mapkey('P', 'Open link from clipboard', function() {
    navigator.clipboard.readText().then(
        text => {
            if (text.startsWith("http://") || text.startsWith("https://")) {
                tabOpenLink(text);
            } else {
                tabOpenLink("https://www.google.com/search?q=" + text);
            }
        }
    );
});


function get_link_markdown() {
    return '[' + document.title + '](' + window.location.href + ')';
}

mapkey('ym', "#7Copy current page's URL as markdown", function() {
    var text = get_link_markdown();
    Clipboard.write(text);
});

addSearchAliasX('t', 'twitter', 'https://twitter.com/search/');
addSearchAliasX('w', 'Wikipedia', 'http://en.wikipedia.org/wiki/Special:Search?search=');
addSearchAliasX('pg', 'Postgres', 'https://www.google.com/search?q=site:http://www.postgresql.org/docs/10/+');
addSearchAliasX('th', 'Pytorch', 'https://pytorch.org/docs/stable/search.html?q=%s&check_keywords=yes&area=default');
addSearchAliasX('gs', 'Google Scholar', 'https://scholar.google.com/scholar?hl=en&as_sdt=0%2C5&q=');