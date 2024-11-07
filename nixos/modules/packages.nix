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

    # TODO: split GUI and CLI tools up
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

    xclip # TODO: move this in xorg file

  ];


}
