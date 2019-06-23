# Original location: https://github.com/romkatv/dotfiles-public/blob/master/.purepower.
# If you copy this file, keep the link to the original and this sentence intact; you are encouraged
# to change everything else.
#
# Remember that colors looks differently in different terminals. Use this script to choose what
# works best for you.
#
#   for ((i = 0; i != 256; ++i)); do print -P "%F{${(l:3::0:)i}}${(l:3::0:)i} TEST%f"; done
#
#                       ATTRIBUTION
#
# Visual design of this configuration borrows heavily from https://github.com/sindresorhus/pure.
# Recretion of Pure look and feel in Powerlevel10k was inspired by
# https://github.com/iboyperson/p9k-theme-pastel.

POWERLEVEL9K_IGNORE_TERM_COLORS=true

() {
  emulate -L zsh && setopt no_unset pipe_fail

  local vi_insert=$'\u276F '
  local vi_cmd=$'\u276E '
  local vi_vis='V '
  local lock=$'\uF023'
  local incoming=$'\u21E3'
  local outgoing=$'\u21E1'
  local root=$'\uF09C'
  local jobs=$'\uF013'

  typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir_writable dir virtualenv anaconda vcs background_jobs status)

  typeset -ga POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

  local p="\${\${\${KEYMAP:-0}:#vicmd}:+${${vi_insert//\\/\\\\}//\}/\\\}}}"
  p+="\${\${\$((!\${#\${KEYMAP:-0}:#vicmd})):#0}:+${${vi_cmd//\\/\\\\}//\}/\\\}}}"

  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.%F{14}${p}%f.%F{001}${p}%f)"
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=$'\n'
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_{LEFT,RIGHT}_SEGMENTS=

  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_COLOR=003
  typeset -g POWERLEVEL9K_LOCK_ICON=$lock

  typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT}_BACKGROUND=none
  typeset -g POWERLEVEL9K_DIR_{ETC,DEFAULT}_FOREGROUND=209
  typeset -g POWERLEVEL9K_DIR_{HOME,HOME_SUBFOLDER}_FOREGROUND=039
  typeset -g POWERLEVEL9K_{ETC,FOLDER,HOME,HOME_SUB}_ICON=

  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=076
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=014
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=011
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=244
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNTRACKEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNSTAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_INCOMING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_OUTGOING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STASHFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_ACTIONFORMAT_FOREGROUND=001
  typeset -g POWERLEVEL9K_VCS_LOADING_ACTIONFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_LOADING_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{GIT,GIT_GITHUB,GIT_BITBUCKET,GIT_GITLAB,BRANCH}_ICON=
  typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'\b|'
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\b?'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\b!'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'\b+'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$incoming
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$outgoing
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'\b#'

  typeset -g POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=none
  typeset -g POWERLEVEL9K_ROOT_ICON=$root

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=002
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_ICON=$jobs

  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=none
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=005
  typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON=

  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
  typeset -g POWERLEVEL9K_PYTHON_ICON=''
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=23

  typeset -g POWERLEVEL9K_ANACONDA_BACKGROUND=none
  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=23
  typeset -g POWERLEVEL9K_ANACONDA_LEFT_DELIMITER="cnd: "
  typeset -g POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=

  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT=custom_rprompt
  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_BACKGROUND=none
  typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_FOREGROUND=012

  function custom_rprompt() {}  # redefine this to show stuff in custom_rprompt segment
} "$@"
