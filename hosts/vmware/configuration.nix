# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/nixos
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Define your hostname.
  networking.hostName = "vmware"; 
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Install Hyprland 
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland; 

  # $ nix search wget
  environment.systemPackages = with pkgs; [
      
  ];

    services.openssh.enable = true;
 
  # Allow unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flakes 
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 
  # Enable virtualization 
  virtualisation.vmware.guest.enable = true; 

  system.stateVersion = "24.11"; # Did you read the comment?

}

