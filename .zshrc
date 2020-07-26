# Created by newuser for 5.8


# Contents are listed in following order:
#     Options
#     Shell Variables
#     Hook Functions
#     Functions
#     Key bindings
#     Completions
#     Highlightings
#     Aliases
#     Variables


## Options ##

setopt append_create
unsetopt clobber
setopt correct
unsetopt correct_all
setopt extended_history
setopt histverify
setopt interactive_comments
setopt magic_equal_subst
setopt noautomenu
setopt prompt_subst


## Shell Variables ##

export HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
export HISTSIZE=100000
export PROMPT_EOL_MARK='%B%S%#%s%b'
export SAVEHIST=100000
export SPROMPT='zsh: correct '\''%B%R%b'\'' to '\''%B%r%b'\'' ([n]/y/a/e)? '
export WORDCHARS=''

export fignore=(.o '~')
export fpath=(~/.zsh/completions ~/.zsh/functions $fpath)

# https://github.com/zsh-users/zsh/blob/96a79938010073d14bd9db31924f7646968d2f4a/Completion/Unix/Command/_git
# Put it in ~/.zsh/completions/

### Prompt String ###
# See https://unix.stackexchange.com/questions/40595/
autoload -U smart-exit-status
PS1='%f'
PS1+=$'%(1v_$(smart-exit-status $?)\n_)'  # exit status
PS1+=$'\n%f'
PS1+="$ZSH_PATCHLEVEL [%L]"  # shell information
PS1+="%(1j. (%j job%(2j s )%).)"  # jobs
PS1+=$'\n'
PS1+='%F{45}%~/%f'  # current directory
PS1+=$'\n'
PS1+='%# '  # prompt character

### Paths ###
# path=(... $path)
# manpath=(... $manpath)


## Hook Functions ##

state='standby'
precmd() {
    if [[ "$state" == 'executing' ]]; then
        state='executed'
        psvar=(1)
    else
        state='standby'
        psvar=()
    fi
    stty intr undef  # ^c
}

preexec() {
    state='executing'
    stty intr '^c'
}

TRAPINT() {
    if [[ "$state" != 'executing' ]]; then
        print -P '%B%S^C%s%b'
    fi
    return $((128+$1))
}


## Functions ##

autoload -U visualize-characters


## Key Bindings ##

stty start undef  # ^q
stty rprnt undef  # ^r
stty stop undef  # ^s
stty kill undef  # ^u
stty werase undef  # ^w

bindkey -e
bindkey '^[#' pound-insert
bindkey '^[f' emacs-forward-word
bindkey '^U' universal-argument
bindkey '^W' kill-region
# bindkey '^I' expand-or-complete-prefix

autoload -U numeric-argument
zle -N numeric-argument && bindkey '^U' numeric-argument

autoload -U send-invisible
zle -N send-invisible && bindkey '^X ' send-invisible

autoload -U zletest
zle -N zletest && bindkey '^X^Z' zletest

autoload -U interrupt-line
zle -N interrupt-line && bindkey '^C' interrupt-line

autoload -U abort
zle -N abort && bindkey '^G' abort '^[^G' abort
bindkey -M isearch '^G' send-break '^[^G' send-break
bindkey -M isearch '^C' send-break

autoload -U describe-key
zle -N describe-key && bindkey '^X^Hk' describe-key

autoload -U describe-variable
zle -N describe-variable && bindkey '^X^Hv' describe-variable

autoload -U input-function-name && zle -N input-function-name
autoload -U describe-function
zle -N describe-function && bindkey '^X^Hf' describe-function

autoload -U delete-horizontal-space
zle -N delete-horizontal-space && bindkey '^[\' delete-horizontal-space


## Completions ##

zstyle ':completion:*' matcher-list 'r:|[._-]=** r:|/=* r:|=*'
autoload -Uz compinit
compinit


## Highlightings ##

zmodload zsh/nearcolor
zle_highlight=(special:fg=9,bold)
source $HOME/git/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zhighlight


## Aliases ##

alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

alias ll=' exa -l --sort=Name --time-style=long-iso'


## Variables ##

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;38;5;74m'
export LESS_TERMCAP_me=$'\e[m'
export LESS_TERMCAP_se=$'\e[m'
# export LESS_TERMCAP_so=$'\e[38;5;246m'
unset LESS_TERMCAP_so
export LESS_TERMCAP_ue=$'\e[m'
export LESS_TERMCAP_us=$'\e[4;38;5;146m'
export LESS=-NR
export BAT_PAGER='less -FRn'
export EXA_COLORS='uu=38;5;10:un=38;5;9:da=38;5;140:ur=1;37:gr=38;5;15:tr=38;5;15:gw=38;5;9:tw=38;5;9:gx=38;5;10:tx=38;5;10:di=1;38;5;68:cc=1;31:ln=1;38;5;213:xx=37:ga=38;5;10:gm=38;5;10:gd=38;5;9:xa=38;5;13'

# export CXX=g++-10
