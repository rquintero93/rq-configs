# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/bin
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

autoload -Uz compinit && compinit

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man-pages colorize themes zsh-interactive-cd zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source "$HOME/config-repo/.env"
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#justin case
# export VIRTUAL_ENV="$HOME/Documents/Global Alumni/.venv:$PATH"
export PATH="/usr/local/opt/:$PATH"
alias zshconfig="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias nerdssh="ssh -i ~/.ssh/pems/RicardoSSH.pem ubuntu@15.237.174.231"
alias sysupdate="brew update && brew upgrade && brew cleanup && omz update"
alias pyinit='bash ~/config-repo/pyinit.sh'
alias rq='bash ~/config-repo/rq.sh'
alias ls='eza --icons --group-directories-first'
alias cat='bat'
alias cd='z'
alias tkill='tmux kill-server'
alias syncrc='cd ~/config-repo && git add . && git commit -m "update conf files" && git push'
alias ndir='cd ~/.config/nvim/'
alias cdir='cd ~/config-repo/'
alias ga='cd ~/Documents/Global\ Alumni/'
# alias ga='tmuxifier s ga'
alias config='tmuxifier s config'
alias db='tmuxifier s db'
# alias tssh='tmuxifier s ssh'
alias lg='lazygit'
alias lzd='lazydocker'
alias nerd='cd ~/Documents/DeSciWorld/nerdBot/'
alias airbyte='ssh -L 8000:localhost:8000 airbyte'
export PATH="/usr/local/sbin:$PATH"
export EDITOR="nvim"
alias db-soa-tunneler='source ~/scripts/ssm-db-tunneler.sh santander eu-west-1 campus-soa san-postgre-2-instance-1-eu-west-1c.cg5xawbcvl2m.eu-west-1.rds.amazonaws.com 5432 5432'
alias db-soa-tunneler-writer='source ~/scripts/ssm-db-tunneler.sh santander eu-west-1 campus-soa san-postgre-2.cluster-cg5xawbcvl2m.eu-west-1.rds.amazonaws.com 5432 5432'
alias db-sx-tunneler='source ~/scripts/ssm-db-tunneler.sh santander eu-west-1 campus-santander-x campus-santander-x-instance-1-eu-west-1a.cg5xawbcvl2m.eu-west-1.rds.amazonaws.com 5432 5432'
alias db-santander-ucpe-tunneler='source ~/scripts/ssm-db-tunneler.sh old_ga eu-west-1 Campus_Santander_UCPE localhost 5432 5432'
alias switch-nvim="/usr/local/bin/switch_nvim_config.sh"
export PATH="$HOME/.tmux/plugins/tmuxifier/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
function jupyconv() { jupytext --to py:percent "$1"; }
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ricardoquintero/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ricardoquintero/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ricardoquintero/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ricardoquintero/google-cloud-sdk/completion.zsh.inc'; fi

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-plugin-fd/zsh-plugin-fd.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autopair/autopair.zsh

#sesh setup
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

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(zoxide init zsh)"
eval "$(tmuxifier init -)"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
#
# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
 fd --hidden --exclude .git . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
 fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

# --- setup fzf theme ---
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"

# export PATH=~/anaconda3/bin:$PATH
# yazi functionality 
function e() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
. "$HOME/.local/bin/env"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ricardoquintero/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
