{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim-config = {
      url = "github:clemjvdm/nixvim-config";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux"; 
    in {
      nixosConfigurations = {
        blueberry = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ 
            ./nixos/configuration.nix
            ./setup.nix
            home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.clement = import ./home-manager/home.nix;
              }
          ];
        };

        # live = nixpkgs.lib.nixosSystem {
        #   specialArgs = { inherit inputs system; };
        #   modules = [
        #     ./nixos/configuration.nix
        #     home-manager.nixosModules.home-manager
        #       {
        #         home-manager.useGlobalPkgs = true;
        #         home-manager.useUserPackages = true;
        #         home-manager.users.clement = import ./home-manager/home.nix;
        #       }
        #     (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
        #     ({ lib, ... }: { # resolve conflict between ssh.nix and minimal instalation
        #       programs.ssh.setXAuthLocation = lib.mkForce false;
        #     })
        #   ];
        #
        # };
      };
      homeConfigurations.clement = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/home.nix ];
      };
    };

}
