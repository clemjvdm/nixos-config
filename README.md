# NixOS config
NixOS / home-manager configuration for my personal computer.

## Using the configuration
First install NixOS, either with the minimal or GUI installer, by following the steps on the NixOS docs. Before running `nixos-install` make sure to add 'git' to the list of packages to install in 'configuration.nix'.

With git installed, clone this repo anywhere on your computer: 

```git clone https://github.com/clemjvdm/nixos-config.git``` 

The autogenerated 'hardware-configuration.nix' needs to be in 'nixos-config/nixos' to work, so copy it there:

```cp /etc/nixos/hardware-configuration.nix nixos-config/nixos/```.

Now you are ready to rebuild the system with: 

```sudo nixos-rebuild switch --flake .#default```

## ISO installer
An ISO can be generated to go through the NixOS installation with the configuration already in place. This is not recommended since this ISO as of now has a broken font and doesn't really provide useful installation tools. To go through the installation with a GUI please just use one of the installers on the NixOS website. Such an ISO may be useful in the future if I decide to improve it.

To build the ISO use the following command:

```nix build .#nixosConfigurations.live.config.system.build.isoImage```


## State of the config

There are different approaches to NixOS configurations I have seen online when learning about NixOS. Often times I see configurations being large repos full of NixOS modules which can be combined easily through custom options to suit any OS needs. I've considered such an approach for this configuration, as can be seen with the `setup.nix` file which would be a file full of custom options to define which custom modules to use and how. Though I am not ruling out expanding this config in such a way, I am currently running NixOS on one machine only and hence have no need for such a configuration. I am still eager to learn more about NixOS, but for now I will focus on other projects, I may work more with NixOS in the somewhat near future as I have plans to host a home server.

# Todo

- [x] better network manager
- [x] fix xfconf keymaps (including switching workspaces)
- [x] add setup settings
- [x] improve mousepad configuration
- [x] battery life optimization
- [x] check if amdgpu driver/kernel option is needed
- [x] qutebrowser config
- [ ] make `rebuild.sh` generate hardware-config.nix if it doesn't exist
- [ ] xfce .nix configuration generator
- [ ] rofi theme
- [ ] default applications
- [ ] package cursor theme (to learn packaging)
- [ ] remove default.nix, by automatically finding modules
- [ ] auto detect nvidia/amdgpu bus id?
- [ ] rofi file browser extended
- [ ] tmux
