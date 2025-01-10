{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "nikos";
    homeDirectory = "/home/nikos";
    };
  
  # NixOs Configuration 
  imports = [
    ./features/cli
    ./features/helix
    ./features/desktop/hyprland
    ./features/desktop/productivity
    ./features/desktop/wireless
    inputs.nix-colors.homeManagerModules.default
  ];
  	
  # Home Manager Release.
  home.stateVersion = "24.11"; # Please read the comment before changing.
  
  # Color Scheme
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

  };

  # Session Variables 
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
