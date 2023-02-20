# Dotfiles

My dotfiles.

**Important: `setup.sh` has not been tested yet!**

## Setup

Remove the `exit` command in `setup.sh` if you want to setup.

```sh
./setup.sh
```

## Current

- `setup.sh` for setting up
- `.vimrc` for [Vim](https://github.com/vim/vim)
- `.zshrc` for [Zsh](https://www.zsh.org/)
- `.zimrc` for [Zim](https://github.com/zimfw/zimfw)
- `.tmux.conf`, `.tmux.conf.local` for [tmux](https://github.com/tmux/tmux) from [this config](https://github.com/gpakosz/.tmux.git)

## TODO

- [ ] Install Neovim with `stable` tag
- [ ] Zim would failed to install if shell has not yet set to Zsh
- [ ] Setup asdf, with `nodejs` and `python` pre-installed
- [ ] Install packages required by extensions
  - `node` (by asdf)
  - `ripgrep`, `fd-find` (for telescope)
  - `tree-sitter-cli` (for treesitter)
  - `gcc`, `g++` (for compiling treesitter parser)

