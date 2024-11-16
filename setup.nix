{
  setup = {
    # general
    bluetooth.enable = true;


    # hardware
    nvidia.enable = true;
    nvidia.prime = {  # make sure hybrid graphics is selected in BIOS
      enable = true;
	    amdgpuBusId = "PCI:6:0:0";
	    nvidiaBusId = "PCI:1:0:0";
    };

  };
}
