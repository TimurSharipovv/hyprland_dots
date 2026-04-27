source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export TERM=xterm-256color
export LANG=en_US.UTF-8

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt hist_ignore_dups

autoload -U colors && colors

fastfetch

eval "$(starship init zsh)"
