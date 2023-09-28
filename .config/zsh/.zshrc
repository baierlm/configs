# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="/home/mark/.oh-my-zsh"

ZSH_THEME="$ZDOTDIR/refined.zsh-theme"
source $ZSH_THEME
# History settings
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=10000
SAVEHIST=10000
#HISTFILE=~/.cache/zsh/history
setopt auto_cd

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
comp_options+=(globdots)		# Include hidden files.

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
export EDITOR='nvim'

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk 
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#source /usr/share/nvm/init-nvm.sh

source ~/.config/zsh/aliasrc

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.config/zsh/.shortcuts

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mark/.conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mark/.conda/etc/profile.d/conda.sh" ]; then
        . "/home/mark/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/mark/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
# vi mode (for some reason has to be at the end)
bindkey -v
export KEYTIMEOUT=1
bindkey -v '^?' backward-delete-char
bindkey -s '^o' 'lfcd\n'


if [ ! -d "$HOME/.config/zsh/plugins/fast-syntax-highlighting" ]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.config/zsh/plugins/fast-syntax-highlighting
fi

if [ ! -d "$HOME/.config/zsh/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/plugins/zsh-autosuggestions
fi
# Should be last.
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
