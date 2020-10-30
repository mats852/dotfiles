#!/bin/bash

# ===== Applications =====

# Starship
eval "$(starship init bash)"

# Brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


# ===== Configurations =====

# Keyboard Speed
xset r rate 225 75

# AWS profile in prompt if applicable
if [ -n "${AWS_VAULT+set}" ]; then 
  PS1="%F{129}AWS-VAULT - %F{156}{%F{197}$AWS_VAULT%F{156}}:$PS1"; 
fi


# ===== Environment variables =====

# NPM TOKEN
export NPM_TOKEN=""

# NVM Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Mylo-Mobile
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Moka-Dev
export PATH=$PATH:$HOME/git/moka-dev

# Rust
export PATH=$PATH:$HOME/.cargo/env

# Deno
export DENO_INSTALL="/home/mats/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
