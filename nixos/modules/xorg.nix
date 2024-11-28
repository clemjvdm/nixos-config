{ pkgs, config, lib, ... }:
let
  cfg = config.setup.xorg;
in 
{
  options.setup.xorg.enable = lib.mkEnableOption "xorg window system";
  config = (lib.mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.xkb.layout = "us";  # configure X11 keymap
    services.xserver.xkb.options = "eurosign:e,caps:escape";
    environment.systemPackages = with pkgs; [ xclip ];
  });
}
