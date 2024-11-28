{ inputs, system, config, lib, ... }: 
let
  cfg = config.setup.nixvim;
in
{
  options.setup.nixvim.enable = lib.mkEnableOption "Nixvim config";
  config = (lib.mkIf cfg.enable {
    environment.systemPackages = [ inputs.nixvim-config.packages.${system}.default ];
  });
}
