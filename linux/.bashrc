# .bashrc
#Limit subdirs
PROMPT_DIRTRIM=1

# Git branch in prompt (#4)
parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\* /s///p'
}
PS1="\[\e[1;32m\]\u@\h:\[\e[0m\]\n\[\e[1;34m\]\w\[\e[0m\] \[\e[33m\]\$(parse_git_branch)\[\e[0m\] \$ "

#terraform
alias tp='terraform plan'

#kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'

#easy management
alias l='ls -l'
alias ll='ls -lha'
alias ..='cd ..'

# Auto-correct and shell QoL improvements
shopt -s cmdhist autocd cdspell

# Better ls/grep/mkdir
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias ls='ls --color=auto'

# sudo last command
alias plz='sudo $(fc -ln -1)'

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/raven/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
