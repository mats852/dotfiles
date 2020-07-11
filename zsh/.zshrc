# Using Starship.rs !
eval "$(starship init zsh)"

# Keyboard Speed
xset r rate 225 75

# NVM Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# add current aws profile in prompt if applicable
if [ -n "${AWS_VAULT+set}" ]; then 
  PS1="%F{129}AWS-VAULT - %F{156}{%F{197}$AWS_VAULT%F{156}}:$PS1"; 
fi

# NPM TOKEN
export NPM_TOKEN="secret-yo"

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Rust
export PATH=$PATH:$HOME/.cargo/env
