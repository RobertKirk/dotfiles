# local, yarn, npm, cargo, ruby bins, spicetify-cli
export SPICETIFY_INSTALL="$HOME/spicetify-cli"
PATH="$HOME/.local/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.emacs.d/bin/:$HOME/.cargo/bin:$HOME/.rbenv/bin:$SPICETIFY_INSTALL:$HOME/.poetry/bin:/Users/robert/Library/Python/3.9/bin:$PATH"
# pyenv bins
PYENV_ROOT="$HOME/repos/pyenv" 
PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
# eval "$(pyenv init -)"
eval "$(rbenv init -)"
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
export fpath=( $HOME/.zsh/functions $fpath )

export PATH="$SPICETIFY_INSTALL:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
