{
  setup = {
   
    # Desktop environment. Only one of these can
    # be enabled at a time. 
    # TODO: make a "desktop-environment" option
    xfce.enable = true;
    cinnamon.enable = false;
    
    # A window compositor which allows effects like
    # transparent windows with blurred backgrounds.
    picom.enable = true;
    
    # Provides a tools for video and audio playback
    # to the system.
    pipewire.enable = true;

    # The Steam game store + options to make games run well
    steam.enable = false;

    # A custom neovim configuration, configured through
    # nixvim.
    # TODO: Let user define custom nixvim config here
    nixvim.enable = true;

    # Enabling bluetooth
    bluetooth.enable = true;

    
    # Battery optimization, only necessary for laptops
    tlp.enable = true;

    # Enabling the nvidia-laptop module makes both
    # prime-offload and prime-sync modes available as specializations
    # (you can switch to them easily on boot). The mode option
    # just changes the default.
    nvidia-laptop = {
      enable = true;
      mode = "prime-offload"; # "prime-offload" | "prime-sync"
    };

    # virt-manager configuration, to run virtual machines
    virtualization.enable = true;

  };
}
