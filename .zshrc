setopt SHARE_HISTORY
unsetopt beep
eval "$(fnm env --use-on-cd)"

source $(dirname $(gem which colorls))/tab_complete.sh

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

NEWLINE=$'\n'
PROMPT="%B%F{147}[%f%n%F{147} @ %f%m%F{147}] %(5~|%-1~/.../%2~|%3~) ${NEWLINE}  %f%b "
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
