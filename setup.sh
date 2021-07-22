#!/bin/bash

# remove below line if you want to setup
exit

# DEBUG: echo command before execute
# set -x

install_if_not_exists() {
  install_method="$1"
  shift
  packages="$@"

  for package in $packages; do
    printf "${YELLOW}Installing ${package}\n"
    # safe huh?
    eval "$install_method $package"
  done
}

prompt() {
  message="$1"
  printf "\033[1;33m${message}\033[0m\n"
}

if [ -x "$(command -v brew)" ]; then
  # macOS
  install="brew install"
  packages=("zsh" "curl" "git" "tmux")
elif [ -x "$(command -v apt)" ]; then
  # Ubuntu
  install="sudo apt install"
  packages=("zsh" "curl" "git" "tmux")
  # sudo apt install zsh curl git
elif [ -x "$(command -v dnf)" ]; then
  # Fedora
  install="sudo dnf install"
  # util-linux-user: chsh
  packages=("zsh" "curl" "git" "util-linux-user" "tmux")
else
  printf "\033[0;31mUnknown install method, exiting...\033[0m"
  exit
fi

install_if_not_exists "${install}" "${packages[@]}"

# Change default shell into zsh
if [ ! -x "$(command -v zsh)" ]; then
  prompt "Changing default shell into zsh"
  chsh -s $(which zsh)
fi

# download Sauce Code Pro Nerd font and build link
prompt "Downloading Sauce Code Pro Nerd font and build link"
mkdir -p ~/.local/share/fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete%20Mono.ttf
old_filename=`ls | grep ttf`
new_filename=`echo $old_filename | sed "s/%20/ /g"`
mv "$old_filename" "$new_filename"
mv "$new_filename" ~/.local/share/fonts

# build link to dot files
prompt "Building links to dot files"
filepath=$(realpath "$0")
dir=$(dirname "$filepath")
ln -sf $dir/.zshrc ~/.zshrc
ln -sf $dir/.vimrc ~/.vimrc
git clone https://github.com/gpakosz/.tmux.git
ln -sf .tmux/.tmux.conf ~/.tmux.conf
cp .tmux/.tmux.conf.local ~

# setup zim
prompt "Setting up Zim"
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
sed -i "
s/bindkey -e/bindkey -v/g
s/#setopt CORRECT/setopt CORRECT/g
s/#zstyle ':zim:git' aliases-prefix 'g'/zstyle ':zim:git' aliases-prefix 'g'/g
s/#zstyle ':zim:input' double-dot-expand yes/zstyle ':zim:input' double-dot-expand yes/g
s/#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'/ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'/g
s/#typeset -A ZSH_HIGHLIGHT_STYLES/typeset -A ZSH_HIGHLIGHT_STYLES/g
s/#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'/ZSH_HIGHLIGHT_STYLES[comment]='fg=10'/g
" ~/.zshrc

# setup Vim Plug
prompt "Setting up Vim Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Yay!
prompt "Finished! Please restart your termnal to apply!"

