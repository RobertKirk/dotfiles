# local, yarn, npm, cargo, ruby bins
PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$HOME/.rbenv/bin:$PATH"
# pyenv bins
PYENV_ROOT="$HOME/repos/pyenv" 
PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
# eval "$(pyenv init -)"
eval "$(rbenv init -)"
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
