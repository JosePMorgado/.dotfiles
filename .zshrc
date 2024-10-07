# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/josepmorgado/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Lines configured by JosePMorgado
# Functions
function prepend_sudo() {
	local current_command=$(fc -ln -1)
	BUFFER="sudo $current_command"
	CURSOR=${#BUFFER}
}
# Register the function as a Zsh widget
zle -N prepend_sudo

bindkey "^R" prepend_sudo

# Ensure the Del key deletes a character
bindkey "^[[3~" delete-char

# Ensure the Home key goes to the beginning of the line
bindkey "^[[1~" beginning-of-line
bindkey "^[[H" beginning-of-line

# Ensure the End key goes to the end of the line
bindkey "^[[4~" end-of-line
bindkey "^[[F" end-of-line

# Set enviroment variables
export XDG_CONFIG_HOME=$HOME/.config

# Source the Zsh theme
source $XDG_CONFIG_HOME/.config/powerlevel10k/powerlevel9k.zsh-theme

# End of lines configured by JosePMorgado

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
