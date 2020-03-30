sudo apt-get update
sudo apt-get install zsh tmux lua5.3 urlview

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
zsh -c 'source ~/.zplug/init.zsh; zplug install'

# neovim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage "$HOME/.local/bin/nvim"
nvim -c 'PlugInstall' -c qa

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

# fd
curl -LO https://github.com/sharkdp/fd/releases/download/v7.5.0/fd_7.5.0_amd64.deb
sudo dpkg -i fd_7.5.0_amd64.deb

git submodule init
git submodule update

# fzf
echo y y n | ./.fzf/install.sh

# pynvim
pip install --user pynvim neovim
pip3 install --user pynvim neovim

nvim -c 'UpdateRemotePlugins' -c qa

# tmux plugins
tmux run-shell "$HOME/.tmux/plugins/tpm/bindings/install_plugins"
