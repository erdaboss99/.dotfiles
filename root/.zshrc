setopt SHARE_HISTORY
unsetopt beep
eval "$(fnm env --use-on-cd)"

source $(dirname $(gem which colorls))/tab_complete.sh

export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!node_modules" -g "!.git" -g "!dist/"'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{node_modules}'"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '{node_modules}'"

alias vim='nvim'
alias nvimc='cd ~/.config/nvim; nvim .'

alias c='clear'
alias l='colorls -al'
alias r='source ~/.zshrc; clear'
alias tt='tree -a -I 'node_modules' -I '.git' -I '.next' -I '.DS_Store''
alias grp='grep --colour=auto'

alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'
alias tk='tmux kill-session'
alias ts='tmux new -s'

alias dev='cd ~/Documents/DEV/; clear'
alias dl='cd ~/Downloads/; clear'
alias dot='cd ~/.dotfiles/; clear'

alias nrd='npm run dev'
alias nrb='npm run build'
alias nrs='npm run start'

alias pt='npx playwright test'
alias pts='npx playwright show-report'

alias g='lazygit'

PROMPT="%B%F{147}[ %f%n%F{147} @ %f%m%F{147} ] %(5~|%-1~/.../%2~|%3~) %f%b "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
