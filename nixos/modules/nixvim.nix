{ inputs, system, ... }: {
  environment.systemPackages = [ inputs.nixvim-config.packages.${system}.default ];
}
