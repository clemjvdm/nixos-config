{ pkgs, config, lib, ... }: 
let
  cfg = config.setup.nvidia-laptop;
in
{
  options.setup.nvidia-laptop.enable = lib.mkEnableOption "NVIDIA GPU configuration for laptop (prime offloading)"; 

  config = (lib.mkIf cfg.enable {
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ]; # "amdgpu"
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      # Use proprietary driver
      open = false;
      nvidiaSettings = true;
      # Select driver
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      # enable and configure PRIME
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
        amdgpuBusId = "PCI:6:0:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    boot.kernelModules = [ "amdgpu" "nvidia" ];
  });
}
