sudo apt-get update
sudo apt-get install zsh tmux

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
zsh -c 'source ~/.zplug/init.zsh; zplug install'

# neovim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage "$HOME/.local/bin/nvim"
nvim -c 'PlugInstall' -c qa

git submodule init
