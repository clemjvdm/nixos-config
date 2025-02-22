{ config, lib, pkgs, ... }:

{
  # Enable the SSH service
  services.openssh.enable = true;

  # Disable password authentication
  services.openssh.passwordAuthentication = false;

  # Enable root login
  services.openssh.permitRootLogin = "yes";
}
