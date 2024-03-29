# Path to your oh-my-zsh installation.
ZSH=$HOME/.zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="pygmalion"
#ZSH_THEME="af-magic"
#ZSH_THEME="agnoster"
#ZSH_THEME="kafeitu"
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
SPACESHIP_CHAR_SUFFIX=" "

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh/oh-my-zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git autojump colored-man-pages virtualenv virtualenvwrapper)
#plugins=(git autojump colored-man-pages command-not-found)
plugins=(git autojump command-not-found zsh-syntax-highlighting)
#plugins=(git autojump command-not-found conda-zsh-completion)

#
# User configuration
# ==================================================

DEFAULT_USER=thiago

# Append our default paths
appendpath () {
	case ":$PATH:" in
		*:"$1":*)
			;;
		*)
			PATH="${PATH:+$PATH:}$1"
	esac
}

# Where finding user binaries
if [[ -d "$HOME/.local/bin" ]]; then
	appendpath "$HOME/.local/bin"
fi

# Default editor
export VISUAL='vim'
export EDITOR='vim'

# Randomly show short fortune messages said by random 'cows'
if [[ -x "/usr/bin/cowsay" && -x "/usr/bin/fortune" ]]; then
	# If not into tmux session
	if [[ -z $TMUX ]]; then
		fortune -s | cowsay -f $(ls /usr/share/cows/*.cow | shuf -n1)
	fi
fi

# For perlbrew
export PERLBREW_ROOT="$HOME/.perl5"
if [[ -f "$PERLBREW_ROOT/etc/bashrc" ]]; then
	source "$PERLBREW_ROOT/etc/bashrc"
fi

# For local::lib
eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"

# For ruby gem
if which gem > /dev/null; then
	export GEM_HOME="$(gem env user_gemhome)"
	appendpath "$GEM_HOME/bin"
fi

# Dircolors theme
if [[ -f "$HOME/.dir_colors" ]]; then
	eval `dircolors "$HOME/.dir_colors"`
fi

# Alias
alias tb='taskbook'

# Enable bash completion
autoload bashcompinit
bashcompinit


# Clean
unset appendpath
# ==================================================

# Custom zsh cache dir
#ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
#mkdir -p $ZSH_CACHE_DIR

source $ZSH/oh-my-zsh.sh

#
# It needs to be sourced at the end of file
# ==================================================

# Ctrl+U as in bash
bindkey '^U' backward-kill-line
bindkey '^Y' yank

# For cd ../
zstyle ':completion:*' special-dirs true
# ==================================================
