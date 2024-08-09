FLAKE_DIR = ~/.dotfiles/nix

.PHONY: all graphical minimal wsl macos update clean

all: graphical home-graphical

# NixOS system rebuild targets

graphical:
	sudo nixos-rebuild switch --flake $(FLAKE_DIR)#nixosGraphical

# TODO: add nix-shell on macOS
# macos:
# 	nix run home-manager/master -- switch --flake $(FLAKE_DIR)#macos

# Home Manager user environment targets

home-graphical:
	home-manager switch --flake $(FLAKE_DIR)#graphical --extra-experimental-features nix-command --extra-experimental-features flakes

# Update the flake inputs
update:
	nix flake update $(FLAKE_DIR)

# Clean up old generations
clean:
	sudo nix-collect-garbage -d

