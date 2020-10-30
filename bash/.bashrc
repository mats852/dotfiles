# .bashrc

# Custom configs
[ -f ~/.config/boot.sh ] && . "/$HOME/.config/boot.sh"
eval "$(starship init bash)"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

