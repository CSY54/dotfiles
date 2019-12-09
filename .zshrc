source ~/antigen.zsh

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-you-should-use

antigen theme bhilburn/powerlevel9k powerlevel9k

# theme setup
source ~/.mytheme.sh

##############################
#          EXPORTS           #
##############################

export TERM="xterm-256color"
export UPDATE_ZSH_DAYS=7
export SSH_KEY_PATH="~/.ssh/rsa_id"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
export LC_ALL=en_US.UTF-8
export EDITOR="vim"

# history
# source: https://unix.stackexchange.com/questions/273861/unlimited-history-in-zsh
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000000
export SAVEHIST=10000000

setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# `TIME` COMMAND

export TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M MB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

##############################
#         ZSH SETUP          #
##############################

ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"

##############################
#           SOURCE           #
##############################

# aliases here
source ~/.bash_profile

antigen apply
