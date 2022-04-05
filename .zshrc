# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$HOME/go/bin:$PATH
# Add kubebuilder to PATH
export PATH=$PATH:/usr/local/kubebuilder/bin
# Add Terraform to PATH
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
# npm global :shrug:
export PATH=~/.npm-global/bin:$PATH
# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# GO
export GOPATH=$HOME/go
export GOPRIVATE=cd.splunkdev.com
#export GOPROXY=https://repo.splunk.com/artifactory/go\|\https://proxy.golang.org\|direct
export GOPROXY=https://proxy.golang.org\|direct

export REVIEW_BASE="origin/mainline"

export CO2_AUTH_DISABLED=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export FZF_DEFAULT_COMMAND='ag --hidden --skip-vcs-ignore -i --ignore .git -g ""'

ZSH_THEME="ys"

# Space before command = not added to shell history
HISTCONTROL=ignorespace

plugins=(dotenv history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

ZSH_DOTENV_FILE=local.env
ZSH_DOTENV_PROMPT=false

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

DISABLE_MAGIC_FUNCTIONS=true

bindkey ' ' magic-space # enable option to expand & edit a command before running it by entering a [space]

alias vi="nvim"
alias vim="nvim"
alias vinone="nvim -u NONE"

# Change % to an empty string
PROMPT_EOL_MARK=''

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases
source $HOME/.zsh_functions

autoload -U colors; colors
source $HOME/custom-zsh-prompts/kube-ps1/kube-ps1.sh
source $HOME/custom-zsh-prompts/cloudctl-ps1/cloudctl-ps1.sh

# Enable vim-mode
bindkey -v

# set VIMODE according to the current mode (default “[i]”)
VIMODE='[i]'
function zle-keymap-select {
 VIMODE="${${KEYMAP/vicmd/[n]}/(main|viins)/[i]}"
 zle reset-prompt
}

zle -N zle-keymap-select

# Standard YS theme prompt with some stuff removed
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\
${git_info}"

# Add on kube_ps1
PROMPT=$PROMPT' $(kube_ps1)'
# Add on cloudctl_ps1
PROMPT=$PROMPT' $(cloudctl_ps1)'
# Add on vim mode
PROMPT=$PROMPT' ${VIMODE}'
# Add on time and exit code
PROMPT=$PROMPT' %{$fg[white]%}[%*] $exit_code'
# Add on the new line and $ prompts
PROMPT=$PROMPT"
\
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

export EDITOR='nvim'

# Welcome message for Tmux
# if [ ! -z "$TMUX" ]; then
#     echo " _________________________________________"
#     echo "|                                         |"
#     echo "|         Tmux session started            |"
#     echo "|                                         |"
#     echo "| * Prefix: \`                             |"
#     echo "|                                         |"
#     echo "| * Split Horizontally: <prefix> -        |"
#     echo "| * Split Vertically: <prefix> \\          |"
#     echo "|                                         |"
#     echo "| * New Window: <prefix> c                |"
#     echo "| * Previous Window: <prefix> p           |"
#     echo "| * Next Window: <prefix> n               |"
#     echo "| * GoTo Window: <prefix> <number>        |"
#     echo "|                                         |"
#     echo " -----------------------------------------"
#     echo "        \   ^__^"
#     echo "         \  (oo)\_______"
#     echo "            (__)\       )\/\\"
#     echo "                ||----w |"
#     echo "                ||     ||"
# fi

# Start tmux automatically
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

# disable bracketed paste mode if the terminal doesn't support escape sequences
if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load Git completion
GIT_COMPLETION_CHECKOUT_NO_GUESS=1
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

if which kubectl > /dev/null 2>&1; then
    # zsh kubectl auto-completion
    source <(kubectl completion zsh)
    # Make it work with  the k alias as well
    complete -F __start_kubectl k
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simondrake/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/simondrake/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/simondrake/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/simondrake/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
[ -f "/Users/simondrake/.ghcup/env" ] && source "/Users/simondrake/.ghcup/env" # ghcup-env
