{ config, pkgs, ... }:

{
  imports = [
    ./cinnamon.nix
    ./xfce.nix
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
    ./picom.nix
    ./zsh.nix
    ./tmux.nix
    ./virtualization.nix
  ];
}
