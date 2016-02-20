#   https://github.com/robbyrussell/oh-my-zsh
#   https://github.com/zsh-users/zsh-syntax-highlighting

# Configure zsh-syntax-highlighting (it's an oh-my-zsh plugin)
# (Uses the defaults plus 'brackets', which tell if parens, etc. are unmatched)
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets)

# Disable Oh My Zsh's annoying auto updates
#DISABLE_AUTO_UPDATE="true"

# I prefer not to have autocompletion be case-insensitive, which is the default
export CASE_SENSITIVE="true"

#ZSH_THEME=avit

export ZSH="$HOME/.oh-my-zsh/"
plugins=(brew brew-cask zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Change zsh-syntax-highlighting comment color once the defaults have been set
# (Gray in Solarized color palette)
ZSH_HIGHLIGHT_STYLES[comment]='fg=green,bold'

# General zshzle options
setopt autocd                     # cd by just typing in a directory name
setopt completealiases            # tab completion includes aliases
setopt nomatch                    # warn me if a glob doesn't match anything
setopt no_case_glob               # globbing is case insensitive
setopt interactive_comments       # commands preceded with '#' aren't run
setopt menu_complete              # Show completions like Vim (cycle through)
export MENU_COMPLETE=1
#setopt extendedglob              # use #, ^, and ~ as glob characters.
                                  # I've disabled this because it makes zsh
                                  # behave more like bash, at the price of
                                  # giving up features I didn't really use.
                                  # (Uncommented, you have to put quotes
                                  # around these characters to use them)


# Don't try to strip the space between the end of a line and a | character
# (See http://superuser.com/questions/613685/)
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&'


# Make ^H and backspace behave correctly
bindkey "^H" backward-delete-char


# Turn on vi keybindings <3 <3 <3 :D and other things
#bindkey -v
#bindkey "^?" backward-delete-char
#bindkey "^W" backward-kill-word
#bindkey "^U" backward-kill-line

# Sometimes pressing ESC + / quickly (i.e., to do a reverse-i-search with
# bindkey -v turned on) would not work properly. This fixes it.
#vi-search-fix() {
#  zle vi-cmd-mode
#  zle .vi-history-search-backward
#}
#autoload vi-search-fix
#zle -N vi-search-fix
#bindkey -M viins '\e/' vi-search-fix

# history search backwords with j/k in vi normal mode
#bindkey -M vicmd 'k' history-beginning-search-backward
#bindkey -M vicmd 'j' history-beginning-search-forward


# Initialize zsh history files
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000


zstyle :compinstall filename $HOME/.zshrc

# I really like Vim's "menu completion" style of tab completion where it lists
# all your options
zstyle ':completion:*:*:*:*:*' menu ''
# This is an attempt to combat oh-my-zsh's poor attempt at fuzzy
# spell-correcting tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={a-zA-Z}'
# Tab completed files will have the same colors as used for `ls --color`
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# zsh has this really cool feature where you can attach descriptions to any tab
# completion entry. I personally don't like them.
zstyle ':completion:*' verbose false

# Turn on all the completion stuff
autoload -Uz compinit && compinit
autoload -Uz promptinit && promptinit

# Use zsh's awesome pattern move:
# zmv '*.c' '*.cpp' and it Just Works™ :o
autoload -Uz zmv


# --- Homebrew specific -------------------------------------------------------

# I've installed zsh installed through Homebrew, so I add these
# lines to make sure tab completion is properly configured
if [ -e $(which brew &> /dev/null && brew --prefix)/etc/zsh_completion ]; then
  source $(brew --prefix)/etc/zsh_completion
fi

# man pages don't exist for zsh builtins (things like setopt, fg, bg, jobs,
# etc.). Including this snippet lets us run things like 'help setopt' to get
# help.
unalias run-help 2> /dev/null
autoload run-help
# (again, this path is specific to zsh installed through Homebrew)
HELPDIR=/usr/local/share/zsh/help
alias help="run-help"

# -----------------------------------------------------------------------------
