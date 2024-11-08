{
  setup = {
    nvidia.enable = true;
    nvidia.laptop = {
      enable = true;
	    amdgpuBusId = "PCI:6:0:0";
	    nvidiaBusId = "PCI:1:0:0";
    };
  };
}
