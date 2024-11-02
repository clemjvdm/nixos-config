# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/default.nix
    ];

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
  };


  networking.hostName = "blueberry"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  time.timeZone = "Europe/Amsterdam"; # set time zone
  services.libinput.enable = true;  # enable touchpad

  users.users.clement = {
    isNormalUser = true;
    initialPassword = "clement";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system.stateVersion = "24.05";  # no touching this
}

