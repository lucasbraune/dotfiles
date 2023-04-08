alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

export EDITOR=vim
declare -r BREW_PREFIX
BREW_PREFIX="$( brew --prefix )"

PATH="/Users/lucasbraune/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/lucasbraune/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/lucasbraune/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/lucasbraune/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/lucasbraune/perl5"; export PERL_MM_OPT;

#export NVM_DIR="$HOME/.nvm"
#  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# Enable autocomplete
source "${BREW_PREFIX}"/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey "^[[A" history-beginning-search-backward # arrow up
bindkey "^[[B" history-beginning-search-forward # arrow down

source "${BREW_PREFIX}"/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

alias ls="ls -G"
#export LSCOLORS=ExFxCxDxBxegedabagacad

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats ' (%b)'
PROMPT='%~${vcs_info_msg_0_} %# '

