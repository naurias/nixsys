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
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    dotfiles = {
      url = "git+https://github.com/naurias/dot-nix.git";
      flake = false;
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
    #nur = {
    #  url = "github:nix-community/NUR";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = {
    self,
    dotfiles,
    nvf,
    #nur,
    stylix,
    #flake-parts,
    #   disko,
    #   agenix,
    mango,
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
          inputs.mango.nixosModules.mango
          ./modules/sys-modules/mangosys.nix
          #nur.modules.nixos.default
          #nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya

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
          inputs.mango.hmModules.mango
          ./modules/home-manager/mango.nix
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
