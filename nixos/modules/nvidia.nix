{ config, lib, pkgs, ... }:

let 
  cfg = config.setup.nvidia;
in
{

  options.setup = {
    nvidia = {
      enable = lib.mkEnableOption "NVIDIA driver configuration";

      prime = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to configure PRIME (needed for laptops)";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    # Enable OpenGL
    hardware.opengl = {
      enable = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {

      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # use open source drivers
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}