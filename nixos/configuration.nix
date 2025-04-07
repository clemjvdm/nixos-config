# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ pkgs, config, ... }:

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
  networking.wireless.enable = false;
  time.timeZone = "Europe/Amsterdam"; # set time zone
  services.libinput.enable = true;  # enable touchpad
  virtualisation.docker.enable = true;

  users.users.clement = {
    shell = pkgs.zsh;  # TODO: Make all these options configurable in setup.nix
    isNormalUser = true;
    initialPassword = "clement";
    # WARN: hardcoded
    extraGroups = [ "wheel" "docker" "libvirtd" ]; # Enable ‘sudo’ for the user.
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEPci7X8yeSXHpZmBVJ0ZQk9jJnxyzD58fe2Gkj/r5OT" ];
  };

  system.stateVersion = "24.05";  # no touching this
}

