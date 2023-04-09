export EDITOR=vim
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
alias ls="ls --color=auto"

# Enable autocomplete
source "$( brew --prefix )"/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[A" history-beginning-search-backward # arrow up
bindkey "^[[B" history-beginning-search-forward # arrow down

source "$( brew --prefix )"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.config/broot/launcher/bash/br

export FZF_DEFAULT_OPTS='--bind=ctrl-d:preview-page-down,ctrl-u:preview-page-up'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# Custom shell prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b)'
PROMPT='%~${vcs_info_msg_0_} %# '

[[ -f ~/.zshrc_local ]] && source ~/.zshrc_local

