#!/usr/bin/env bash zsh
# https://gitlab.com/hankchanocd/dotfiles/.script/.search
# A collection of useful search scripts

function search() { # Recursive search for matched file names, -L: symbolic links search
	find -L . -iname "$1*" | grep -i "$1*"
}

function antisearch() { # -L searches for files not containing the given pattern
	grep -iRL "$1*" .
}

function deepsearch() { # alias cannot take arguments but a function can work just like an alias
	if [ "$1" = "-s" ] || [ "$1" = "--show" ]; then
		grep -r --exclude='*.csv' --exclude-dir=node_modules -iRn "$2*" . # Exclude .csv file type
	elif [ "$1" = "-sa" ] || [ "$1" = "--showall" ]; then
		grep -A 3 -r --exclude='*.csv' --exclude-dir=node_modules -iRn "$2*" . # Exclude .csv file type
	else # else show the count of the matched strings
		grep -iRc "$1*" --exclude='*.csv' --exclude-dir=node_modules . | grep -v ':0' | highlight --theme ~/.highlightrc/.highlightrc
	fi
}

function antideepsearch() { # L searches for files not containing the given pattern
	grep -iRL "$1*" .
}

############################### fzf ###############################
# Examples: https://github.com/junegunn/fzf/wiki/examples

# fuzzy list all aliases
function aliases() {
	command=$(alias |
		rg --color always --no-line-number --colors=match:fg:blue --passthru '^[^=]+' |
		fzf-tmux --cycle --ansi --reverse --height=90% --query="$1" --multi --select-1 --exit-0 --tac |
		cut -d "=" -f 1)
	echo $command
}

# fuzzy list all commands with manual
function cmd() {
	compgen -ca |
		sort --unique |
		grep --invert-match '^_' | # Remove all hidden commands that start with '_'
		fzf --ansi --reverse --cycle --height=90% --preview='man {}' --preview-window=right:75%
	# Only use `man {}` for preview since using `{} -h` may result in invoking the command
}

function path() {
	list=$(echo $PATH |
		tr : '\n' |
		sort --unique |
		rg --color always --no-line-number --colors=match:fg:blue '[/]')

	if type fzf >/dev/null 2>&1; then
		$(echo "$list" |
			fzf --ansi --reverse --cycle --height=50%)
	else
		echo "$list"
	fi
}

# fuzzy search and file preview
function f() {
	files=$(fzf --cycle --preview-window=right:70% --preview '[[ $(file --mime {}) =~ binary ]] &&
                 echo {} is a binary file ||
                 bat {} 2> /dev/null | head -500')
	[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Open file with the VS Code
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
function fopen() {
	local files
	IFS=$'\n' files=($(fzf-tmux --cycle --reverse --height=90% --query="$1" --multi --select-1 --exit-0))
	[[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Like normal cd but opens an interactive navigation window when called with no arguments.
unalias cdf 2>/dev/null
function cdf() {
	while true; do
		local lsd=$(ls --color=never -a -p | grep '/$' | sed 's;/$;;')
		local dir="$(printf '%s\n' "${lsd[@]}" |
			fzf --select-1 --reverse --cycle --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -a -p "${__cd_path}";
        ')"
		[[ ${#dir} != 0 ]] || return 0
		cd "$dir" &>/dev/null
	done
}
