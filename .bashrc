#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias mnt='udisksctl mount -b'
alias umnt='udisksctl unmount -b'
alias ls='exa -al --color=always --group-directories-first'
alias emacs='emacs -nw'
alias ..='cd ..'
alias ...='cd ../..'

colorscript random

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export EDITOR=nvim

export PATH=$PATH:~/scripts/
export PATH=$PATH:~/.config/rofi/scripts/
export PATH=$PATH:~/.emacs.d/bin/
