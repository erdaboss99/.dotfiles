# Steps to bootstrap a new Mac

1. Install Apple's Command Line Tools

```zsh
xcode-select --install
```

2. Install Brew

[Homebrew website](https://brew.sh/)

3. Clone the repo

```zsh
# Use SSH (if set up)...
git clone git@github.com:erdaboss99/.dotfiles.git ~/.dotfiles
```

```zsh
# ...or use HTTPS and switch remotes later.
git clone https://github.com/erdaboss99/.dotfiles.git ~/.dotfiles
```

4. Install Homebrew packages from `Brewfile`.

```zsh
brew bundle
```

5. Create symlinks

```zsh
# zsh config
ln -s ~/.dotfiles/root/.zshrc ~/.zshrc
ln -s ~/.dotfiles/root/.zprofile ~/.zprofile
```

```zsh
# fzf ignore
ln -s ~/.dotfiles/root/.ignore ~/.ignore
```

```zsh
# TMUX config
# TPM is required! Install it from here https://github.com/tmux-plugins/tpm
ln -s ~/.dotfiles/root/.tmux.conf ~/.tmux.conf
```

```zsh
# BACKUP ONLY
# NVChad custom config folder
# NVChad is required! Install it from here https://nvchad.com/docs/quickstart/install
ln -s ~/.dotfiles/nvchad/custom ~/.config/nvim/lua/custom
```

```zsh
# NVIM config
ln -s ~/.dotfiles/nvim ~/.config/nvim
```

```zsh
# wezterm config
ln -s ~/.dotfiles/root/.wezterm.lua ~/.wezterm.lua
```
