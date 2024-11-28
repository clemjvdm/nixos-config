{ pkgs, config, lib, ... }:
let
  cfg = config.setup.steam;
in 
{
  options.setup.steam.enable = lib.mkEnableOption "Steam module";

  config = (lib.mkIf cfg.enable {
    programs.steam.enable = true;
    environment.systemPackages = with pkgs; [
      mangohud # `mangohud %command%` in steam startup options
    ];
    programs.gamemode.enable = true;
  });
}
