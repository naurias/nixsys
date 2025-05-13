{
  description = ''
    Personal nixos configuration for user nix and system nixreaper
  '';

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    dotfiles = {
      url = "git+https://github.com/naurias/dot-nix.git";
      flake = false;
    };
    #		agenix.url = "github:ryantm/agenix";
    #   sops-nix.url = "github:Mic92/sops-nix";

    #		disko = {
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
    #			url = "";
    #			inputs.nixpkgs.follows = "nixpkgs";
    #		};
  };

  outputs = {
    self,
    dotfiles,
    nvf,
    stylix,
    #   disko,
    #   agenix,
    home-manager,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      #      "aarch64-linux"
      #      "i686-linux"
      "x86_64-linux"
      #      "aarch64-darwin"
      #      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages =
      forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    overlays = import ./overlays {inherit inputs;};
    homeManagerModules = import ./modules/home-manager;
    nixosConfigurations = {
      nixreaper = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/nixreaper
          nvf.nixosModules.default
          stylix.nixosModules.stylix
          #				inputs.disko.nixosModules.disko
          #				agenix.nixosModules.default
        ];
      };
    };
    homeConfigurations = {
      "nix@nixreaper" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [
          ./home/nix/nixreaper.nix
        ];
      };
    };

    #		colmena = {
    #			meta = {
    #				nixpkgs = import nixpkgs {
    #					system = "x86_64-linux";
    #				};
    #				specialArgs = {inherit inputs outputs;};

    # this colmena node will make nixreaper use stable branch
    #				nodeNixpkgs = {
    #					nixreaper = import nixpkgs-stable {
    #						system = x86_64-line;
    #					};
    #				};

    #			};

    #			nixreaper = {
    #				deployment = {
    #					targetHost = "nixreaper";
    #					targetUser = "nix";
    #					tags = ["main"];
    #				};
    #				imports = [
    #					./hosts/nixreaper
    #					# these are modules stated above
    #					#inputs.disko.nixosModules.disko
    #					#agenix.nixosModules.default
    #				];
    #
    #			};
    #		};
  };
}
