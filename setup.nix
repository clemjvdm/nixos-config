{
  setup = {
    nvidia.enable = true;

    # IMPORTANT: When selecting BIOS make sure hybrid graphics are selected in BIOS, as it enables GPU offloading.
    nvidia.laptop = {
      enable = true;
	    amdgpuBusId = "PCI:6:0:0";
	    nvidiaBusId = "PCI:1:0:0";
    };
  };
}
