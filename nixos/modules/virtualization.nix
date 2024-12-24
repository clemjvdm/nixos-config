{ lib, config, ... }:
let
  cfg = config.setup.virtualization;
in
{
  options.setup.virtualization.enable = lib.mkEnableOption "virt-manager configuration";
  config = ( lib.mkIf cfg.enable {

    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    # TODO: This should be added to home manager
    # programs.dconf.settings = {
    #   "org/virt-manager/virt-manager/connections" = {
    #     autoconnect = ["qemu:///system"];
    #     uris = ["qemu:///system"];
    #   };
    # };
  });
}
