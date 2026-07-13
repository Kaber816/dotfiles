#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
(cat ~/.cache/wal/sequences &)

export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/Dev/gcc-arm-none-eabi-10-2020-q4-major/bin:$PATH"

