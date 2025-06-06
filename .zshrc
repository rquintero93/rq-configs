# zmodload zsh/zprof # Uncomment to profile zsh startup
# Load zsh-defer
source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-defer/zsh-defer.plugin.zsh"

# Antidote plugin manager
zsh-defer -t 0.5 source ~/.antidote/antidote.zsh
zsh-defer -t 0.5 antidote load ~/.zsh_plugins.txt

# Prompt
zsh-defer eval "$(starship init zsh)"

if [[ ! -f ~/.starship.cache || ! -s ~/.starship.cache || $(( $(date +%s) - $(stat -f %m ~/.starship.cache) )) -gt 86400 ]]; then
 starship init zsh > ~/.starship.cache
fi
source ~/.starship.cache
#
# ENV
zsh-defer source "$HOME/config-repo/.env"
zsh-defer . "$HOME/.local/bin/env"

# Editor
export EDITOR="nvim"

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias nerdssh="ssh -i ~/.ssh/pems/RicardoSSH.pem ubuntu@15.237.174.231"
alias sysupdate="brew update && brew upgrade && brew cleanup && antidote update"
alias pyinit='bash ~/config-repo/pyinit.sh'
alias rq='sesh connect .'
alias ls='eza --icons --group-directories-first'
alias cat='bat'
alias cd='z'
alias tkill='tmux kill-server'
alias syncrc='cd ~/config-repo && git add . && git commit -m "update conf files" && git push'
alias ndir='cd ~/.config/nvim/'
alias cdir='cd ~/config-repo/'
alias ga='cd ~/Documents/Global\ Alumni/'
alias config='sesh connect config'
alias db='sesh connect db'
alias lg='lazygit'
alias lzd='lazydocker'
alias nerd='cd ~/Documents/DeSciWorld/nerdBot/'
alias airbyte='ssh -L 8000:localhost:8000 airbyte'
alias switch-nvim="/usr/local/bin/switch_nvim_config.sh"

# PATHs
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fpath=(/Users/ricardoquintero/.docker/completions $fpath)
#
# DB Tunnel Aliases
alias db-soa-tunneler='source ~/scripts/ssm-db-tunneler.sh santander eu-west-1 campus-soa san-postgre-2-instance-1-eu-west-1c.cg5xawbcvl2m.eu-west-1.rds.amazonaws.com 5432 5432'
alias db-soa-tunneler-writer='source ~/scripts/ssm-db-tunneler.sh santander eu-west-1 campus-soa san-postgre-2.cluster-cg5xawbcvl2m.eu-west-1.rds.amazonaws.com 5432 5432'
alias db-sx-tunneler='source ~/scripts/ssm-db-tunneler.sh santander eu-west-1 campus-santander-x campus-santander-x-instance-1-eu-west-1a.cg5xawbcvl2m.eu-west-1.rds.amazonaws.com 5432 5432'
alias db-santander-ucpe-tunneler='source ~/scripts/ssm-db-tunneler.sh old_ga eu-west-1 Campus_Santander_UCPE localhost 5432 5432'

# # Defer heavy plugin loads
# zsh-defer source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# zsh-defer source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-defer source /usr/local/share/zsh-autopair/autopair.zsh


# sesh fuzzy selector
function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}
zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions

# FZF + fd setup
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
_fzf_compgen_path() { fd --hidden --exclude .git . "$1" }
_fzf_compgen_dir() { fd --type=d --hidden --exclude .git . "$1" }
# FZF CTRL-R: Fancy layout with syntax-highlighted preview
export FZF_CTRL_R_OPTS="
  --height 60%
  --reverse
  --preview 'echo {} | sed \"s/^ *//\" | bat --style=plain --language=bash --paging=never --color=always'
  --preview-window=up:3:wrap
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort'
  --border
  --color=border:#444444"
# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:-1,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"

source ~/fzf-git.sh/fzf-git.sh

# Full fzf shell integration (keybindings + completion)
if [[ -f ~/.fzf.zsh ]]; then
  source ~/.fzf.zsh
elif [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# yazi integration
function e() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Lazier init with longer timeouts
zsh-defer -t 1 eval "$(thefuck --alias)"
zsh-defer -t 0.5 eval "$(zoxide init zsh)"
zsh-defer -t 0.5 eval "$(tmuxifier init -)"
zsh-defer -t 0.5 eval "$(fzf --zsh)"

# Visual feedback for completions
COMPLETION_WAITING_DOTS="true"


# Cache completions
# autoload -Uz compinit
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#   compinit
# else
#   compinit -C
# fi

# zprof # Uncomment to profile zsh startup
