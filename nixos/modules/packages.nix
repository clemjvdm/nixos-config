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

    # Desktop 
    firefox
    chromium
    qutebrowser
    blueman
    mpv
    gparted

    # Coding essentials
    gcc
    gnumake

    xclip

  ];


}
