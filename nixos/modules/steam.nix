{ pkgs, ... }:

{
  programs.steam.enable = true;
  environment.systemPackages = with pkgs; [
    mangohud # `mangohud %command%` in steam startup options
  ];
  programs.gamemode.enable = true;
}
