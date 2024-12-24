{ pkgs, config, lib, ... }: 
let
  cfg = config.setup.nvidia-laptop;
in
{
  options.setup.nvidia-laptop = {
    enable = lib.mkEnableOption "NVIDIA GPU configuration for laptop (prime offloading)"; 
    mode = lib.mkOption {
      type = lib.types.enum [ "prime-sync" "prime-offload" ];
      default = "prime-offload";
      description = "GPU mode - either PRIME offload or PRIME sync";
    };
  };


  config = lib.mkMerge [
    (lib.mkIf (cfg.enable && cfg.mode == "prime-offload") {
      hardware.graphics.enable = true;
      services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];
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
          # WARN: hardcoded BusIds should be changed
          amdgpuBusId = "PCI:6:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
      boot.kernelModules = [ "amdgpu" "nvidia" ];
    })

    (lib.mkIf (cfg.enable && cfg.mode == "prime-sync") {
      hardware.graphics.enable = true;
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia = {
        modesetting.enable = true;
        # Use proprietary driver
        open = false;
        nvidiaSettings = true;
        # Select driver
        package = config.boot.kernelPackages.nvidiaPackages.stable;

        # enable and configure PRIME
        prime = {
          sync.enable = true;
          amdgpuBusId = "PCI:6:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    })
    
    (lib.mkIf cfg.enable { 
      specialisation = {
        prime-sync.configuration = { setup.nvidia-laptop.mode = lib.mkForce "prime-sync"; };
        prime-offload.configuration = { setup.nvidia-laptop.mode = lib.mkForce "prime-offload"; };
      }; 
    })
  ];


}
