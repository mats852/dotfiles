{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mats";
  home.homeDirectory = "/home/mats";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    starship
    alacritty
    tmux
    go_1_22
    nodejs_22
    discord
    google-chrome
    flameshot

    (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".bashrc".text = ''
      if [ -f ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]; then
        source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
      fi

      if [ -f ~/.dotfiles/bash/aliases.sh ]; then
        source ~/.dotfiles/bash/aliases.sh
      fi

      eval "$(starship init bash)"
    '';

    ".profile".text = ''
      if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
        if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
        fi
      fi
    '';

    ".config/nvim".source = ../../nvim;
    ".config/alacritty/alacritty.toml".source = ../../alacritty/alacritty.toml;
    ".tmux.conf".source = ../../tmux/.tmux.conf;
    ".config/i3/config".source = ../../i3/config;
  };  

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mats/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/go/bin"
    "$HOME/.npm-global"
  ];

  # ----- Programs -----
  programs.home-manager.enable = true;

  programs.starship.enable = true; 
}
