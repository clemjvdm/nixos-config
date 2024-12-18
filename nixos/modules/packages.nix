{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [

    # CLI tools
    git
    htop
    tree
    neofetch
    curl
    wget
    inxi
    pciutils
    glxinfo
    unzip

    # TODO: split GUI and CLI tools up
    # Desktop 
    firefox
    chromium
    mpv
    gparted
    bluez-tools

    # Coding essentials
    gcc
    gnumake

    powertop
  ];


}
