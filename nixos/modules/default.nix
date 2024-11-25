{ config, pkgs, ... }:

{
  imports = [
    ./xorg.nix
    ./nixvim.nix
    ./packages.nix
    ./fonts.nix
    ./pipewire.nix
    ./bootloader.nix
    ./nvidia-laptop.nix
    ./networking.nix
    ./tlp.nix
    ./bluetooth.nix
    ./steam.nix
  ];
}
