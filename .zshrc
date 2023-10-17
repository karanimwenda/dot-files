# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
VULKAN_SDK=('/home/c3n7/.programs/vulkan_sdk/x86_64')
export VULKAN_SDK
# For compatibility with pror releases e.g. vkvia
export VK_SDK_PATH=$VULKAN_SDK
export LD_LIBRARY_PATH=$VULKAN_SDK/lib
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d
#export VK_ICD_FILENAMES=/etc/vulkan/icd.d/nvidia_icd.json
export EDITOR=/usr/bin/nvim
export CHROME_EXECUTABLE=google-chrome-stable

path+=("/home/c3n7/.programs/flutter/bin")
path+=("/home/c3n7/.programs/jam")
path+=("/home/c3n7/.gem/ruby/3.0.0/bin")
path+=("/home/c3n7/.programs/defold/Defold")
path+=("/home/c3n7/Android/Sdk/ndk/22.0.7026061")
path+=("/home/c3n7/.cargo/bin")
path+=("/home/c3n7/.go/bin")
path+=("/home/c3n7/.programs/appimagetool")
path+=("/home/c3n7/.npm-global/bin")
path+=("/home/c3n7/.programs/exercism")
path+=("/home/c3n7/.config/composer/vendor/bin")
path+=('/home/c3n7/.programs/eww/target/release')
path+=('/home/c3n7/.dotnet/tools')
path+=('/home/c3n7/.programs/gdx-setup')
path+=('/home/c3n7/.emacs.d/bin')
# Add vulkan to path
path=($VULKAN_SDK $path)
export PATH

SCONS="/home/c3n7/.programs/scons-2.5.1/script/scons"
export SCONS

# Use clang by default
# export CC=clang
# export CXX=clang++

# Path to your oh-my-zsh installation.
export ZSH="/home/c3n7/.oh-my-zsh"
export ANDROID_HOME="/home/c3n7/Android/Sdk"
export GOPATH="/home/c3n7/.go"

export DOTNET_CLI_TELEMETRY_OPTOUT=true

eval "$(zoxide init zsh)"

eval `ssh-agent` > /dev/null

# Enable both 32 bit and 64 bit Wine environments
#WINEARCH=win32 WINEPREFIX=~/win32 winecfg
#WINEPREFIX=~/win64 winecfg

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls='lsd'
alias l='ls -a'
alias la='ls -a'
alias lla='ls -la'
# alias lt='ls --tree'

alias nv='neovide > /dev/null & ; disown %1 '

alias icat="kitty +kitten icat"

alias kill_android="killall /home/c3n7/.programs/android-studio/jre/bin/java"

alias composer7='php7 /usr/bin/composer'
alias ssh="kitty +kitten ssh"

alias gpp='git pull && git push'
alias gppu="git pull upstream main && git push upstream main"
alias gpb="git pull && git push && git pull upstream main && git push upstream main"
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# (cat ~/.cache/wal/sequences &)

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/home/c3n7'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET
