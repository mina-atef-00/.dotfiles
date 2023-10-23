# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -e ~/.dotfiles/manjaro-zsh-config.zsh ]]; then
  source ~/.dotfiles/manjaro-zsh-config.zsh
fi

#?General Aliases
alias cp="cp -i"
alias mv="mv -i"
alias cpr="rsync -ahP"  # confirm before overwriting something
alias mvr="rsync -ahP --remove-source-files"
alias df="df -h"  # human-readable sizes
alias free="free -m"  # show sizes in MB
alias vim="nvim"
alias vi="nvim"
alias ll="exa -al --color=auto --group-directories-first --header --icons"
alias rg="rg --color=auto"
alias bcat="batcat --theme 'Dracula'"
alias less="bcat"
alias ipy="ipython3"
alias alembic_rev="alembic revision --autogenerate"
alias alembic_up="alembic upgrade head"
alias d="docker"

#? Heroku Aliases
# alias hstart="heroku ps:scale worker=1"
# alias hstop="heroku ps:scale worker=0"
# alias hlogs="heroku logs --tail"
# alias hpush="git push heroku main:main"
# alias hrestart="heroku ps:restart"

#? Saskatoon ssh
# alias "saskdev"="eval $(ssh-agent)>/dev/null;ssh-add;ssh saskatoon-dev"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mina/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mina/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mina/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mina/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
