##################################################
##                                              ##
## Author: Johannes Steudle                     ##
## File: .zshrc                                 ##
## Date: 29.04.2010                             ##
##                                              ##
## Description: .zshrc general settings         ##
##                                              ##
##################################################

export EDITOR=vim
export PAGER=less
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
export TERM=screen

export HISTSIZE=20000
export HISTFILE=~/.dotfiles/.zhistory
export SAVEHIST=20000

# some path variables
export PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/sbin:/usr/texbin:~/.bin
export PATH=$PATH:/opt/local/bin:/opt/local/sbin
export PATH=$PATH:/Users/johannes/QtSDK/Desktop/Qt/474/gcc/bin
export NODE_PATH=/usr/local/lib/node
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Library/Frameworks

#Set the auto completion on
autoload -Uz compinit promptinit
autoload -U colors
compinit
promptinit
colors


PS1='$['$'%{\e[01;32m%}%n@%{\e[0;34m%}%m%{\e[0;00m%}:%{\e[0;36m%}%*%{\e[0;00m%}:%{\e[0;31m%}%~%{\e[0;00m%}][%j]
%(!.#.:) %{\e[00m%}'
# RPS1=$'%{\e[0;36m%}%*%{\e[00m%}'

PS2='%_>'

if [ -f ~/.dotfiles/.zsh_options ]; then
	. ~/.dotfiles/.zsh_options
else
  echo ".zsh_options not found!"
fi
if [ -f ~/.dotfiles/.zsh_functions ]; then
	. ~/.dotfiles/.zsh_functions
else
  echo ".zsh_functions  not found!"
fi
if [ -f ~/.dotfiles/.zsh_completion ]; then
	. ~/.dotfiles/.zsh_completion
else
  echo ".zsh_completion  not found!"
fi
if [ -f ~/.dotfiles/.zsh_aliases ]; then
	. ~/.dotfiles/.zsh_aliases
else
  echo ".zsh_aliases  not found!"
fi

# color setup for ls:
check_com -c dircolors && eval $(dircolors -b)
# color setup for ls on OS X:
isdarwin && export CLICOLOR=1

## keybindings (run 'bindkeys' for details, more details via man zshzle)
# use emacs style per default:
# bindkey -e
# use vi style:
# bindkey -v

#if [[ "$TERM" == screen ]] ; then
# bindkey '\e[1~'   beginning-of-line  # Linux console
# bindkey '\e[H'    beginning-of-line  # xterm
# bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '^A'    beginning-of-line  # gnome-terminal
bindkey '^E'    end-of-line        # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
# bindkey '\e[4~'   end-of-line        # Linux console
# bindkey '\e[F'    end-of-line        # xterm
# bindkey '\eOF'    end-of-line        # gnome-terminal
bindkey '^R' history-incremental-search-backward
bindkey '^[[A'   history-search-backward
bindkey '^[[B'   history-search-forward
# bindkey -s '^L' "|less\n"             # ctrl-L pipes to less
# bindkey -s '^B' " &\n"                # ctrl-B runs it in the background

