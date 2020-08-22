# Debug
[[ -n $DEBUG ]] && set -x

setopt PROMPT_SUBST
autoload -U add-zsh-hook
add-zsh-hook precmd _cloudctl_ps1_get_context_ns
zmodload zsh/stat
zmodload zsh/datetime

CLOUDCTL_PS1_BINARY="${CLOUDCTL_PS1_BINARY:-cloudctl}"
CLOUDCTL_PS1_LAST_TIME=0
CLOUDCTL_PS1_ENABLED=true
CLOUDCTL_PS1_SYMBOL_ENABLE="${CLOUDCTL_PS1_SYMBOL_ENABLE:-true}"
CLOUDCTL_PS1_SYMBOL_DEFAULT="${CLOUDCTL_PS1_SYMBOL_DEFAULT:-\u23C8 }"
# CLOUDCTL_PS1_SYMBOL_USE_IMG="${CLOUDCTL_PS1_SYMBOL_USE_IMG:-false}"

CLOUDCTL_PS1_COLOR_SYMBOL="%{$fg[blue]%}"
CLOUDCTL_PS1_COLOR_CONTEXT="%{$fg[yellow]%}"

_cloudctl_ps1_binary_check() {
  command -v "$1" >/dev/null
}

_cloudctl_ps1_symbol() {
  [[ "${CLOUDCTL_PS1_SYMBOL_ENABLE}" == false ]] && return

  CLOUDCTL_PS1_SYMBOL="${CLOUDCTL_PS1_SYMBOL_DEFAULT}"
  CLOUDCTL_PS1_SYMBOL_IMG="\u26C8 "

  if [[ "${CLOUDCTL_PS1_SYMBOL_USE_IMG}" == true ]]; then
    CLOUDCTL_PS1_SYMBOL="${CLOUDCTL_PS1_SYMBOL_IMG}"
  fi

  echo "${CLOUDCTL_PS1_SYMBOL}"
}

# function to disable the prompt on the current shell
splunk_cloudctl_on(){
  CLOUDCTL_PS1_ENABLED=true
}

# function to disable the prompt on the current shell
splunk_cloudctl_off(){
  CLOUDCTL_PS1_ENABLED=false
}

_cloudctl_ps1_get_context_ns() {

  if [ ! -f ~/.cloudctl/config.yaml ]; then
    # if config file doesn't exist, obviously don't try and cat it
    CLOUDCTL_PS1_CONTEXT="N/A-Context"
    return
  fi


  # Set the command time
  SPLUK_CLOUDCTL_PS1_LAST_TIME=$EPOCHSECONDS
  # CLOUDCTL_PS1_CONTEXT="$(${CLOUDCTL_PS1_BINARY} config show-context)"
  CLOUDCTL_PS1_CONTEXT="$(cat ~/.cloudctl/config.yaml | grep env | awk '{print $2}')"
  if [[ -z "${CLOUDCTL_PS1_CONTEXT}" ]]; then
    CLOUDCTL_PS1_CONTEXT="N/A-Context"
    return
  fi
}

# Build our prompt
cloudctl_ps1 () {
  # There's no point doing anything unless the cloudctl executable exists
  if ! command -v cloudctl &> /dev/null; then
    return
  fi

  local reset_color="%{$reset_color%}"
  [[ ${CLOUDCTL_PS1_ENABLED} != 'true' ]] && return

  CLOUDCTL_PS1="${reset_color}$CLOUDCTL_PS1_PREFIX"
  CLOUDCTL_PS1+="${CLOUDCTL_PS1_COLOR_SYMBOL}$(_cloudctl_ps1_symbol)"
  CLOUDCTL_PS1+="${reset_color}$CLOUDCTL_PS1_SEPERATOR"
  CLOUDCTL_PS1+="${CLOUDCTL_PS1_COLOR_CONTEXT}$CLOUDCTL_PS1_CONTEXT${reset_color}"
  CLOUDCTL_PS1+="$CLOUDCTL_PS1_SUFFIX"

  echo "${CLOUDCTL_PS1}"
}

