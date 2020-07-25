# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment

# ------ General Settings ------

# Keyboard Speed
xset r rate 225 75

# NPM TOKEN
export NPM_TOKEN=""

# Aws-Vault
if [ -n "${AWS_VAULT+set}" ]; then 
  PS1="%F{129}AWS-VAULT - %F{156}{%F{197}$AWS_VAULT%F{156}}:$PS1"; 
fi


# ------ Apps ------

# Linux Brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Using Starship.rs !
eval "$(starship init bash)"


# ------ Paths ------

# Add .local/bin to PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Moka-Dev
export PATH=$PATH:$HOME/repos/github.com/getMylo/moka-dev

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# NVM Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Rust
export PATH=$PATH:$HOME/.cargo/env

# Golang
export PATH=$PATH:$HOME/.local/go/bin

