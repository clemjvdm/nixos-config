{ config, pkgs, ... }:

{
  imports = [
    ./xorg.nix
    ./nixvim.nix
    ./packages.nix
    ./fonts.nix
    ./pipewire.nix
    ./bootloader.nix
    ./nvidia.nix
    ./networking.nix
  ];
}
