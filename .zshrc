# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$HOME/go/bin:$PATH
# Go
export PATH=/usr/local/go/bin:$PATH
# Add kubebuilder to PATH
export PATH=$PATH:/usr/local/kubebuilder/bin
# Add Terraform to PATH
export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"
# npm global :shrug:
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.local/bin:$PATH
# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# GO
export GOPATH=$HOME/go
export GOPROXY=https://proxy.golang.org\|direct

# K8s
export KUBECONFIG="${HOME}/.kube/config:${HOME}/.kube/remote-config"

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

DISABLE_MAGIC_FUNCTIONS=true

bindkey ' ' magic-space # enable option to expand & edit a command before running it by entering a [space]

# Change % to an empty string
PROMPT_EOL_MARK=''

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases
source $HOME/.zsh_functions
source $HOME/.zsh_cpn

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_HIGHLIGHT_STYLES[comment]=fg=245

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
# Add on time
PROMPT=$PROMPT' %{$fg[white]%}[%*]'
# Add on exit code
# %(?..[%?] ) is a conditional expression.
# The part between the two dots (nothing in this case) is output if the expression before the first dot is true.
# The part after the second dot is output if it's false.
#
# i.e. This outputs the status code in green if it was successful and red if it failed
PROMPT=$PROMPT' %(?.$fg[green][%?].$fg[red][%?] )'
# Add on the new line and $ prompts
PROMPT=$PROMPT"
\
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

export EDITOR='nvim'

# Clear scrollback and screen for zsh and tmux
# Use ctrl+L
clear-scrollback-and-screen () {
  zle clear-screen
  tmux clear-history
}
zle -N clear-scrollback-and-screen
bindkey -v '^L' clear-scrollback-and-screen

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

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  # FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

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

# OS specific instructions
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    # ...
else
    # Unknown.
fi

if [ -f $HOME/workdot/.zshrc ]; then source $HOME/workdot/.zshrc; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

complete -o nospace -C /opt/homebrew/bin/vault vault
