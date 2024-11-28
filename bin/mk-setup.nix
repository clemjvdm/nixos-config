let
  lib = (import<nixos/nixpkgs/lib>);
  pkgs = { };
  bluetoothModule = import ../nixos/modules/bluetooth.nix;
  evaluated = lib.evalModules {
    modules = [ 
      { config._module.check = false; }
      bluetoothModule 
    ];
    specialArgs = { inherit pkgs; };
  };

in
  evaluated.options
