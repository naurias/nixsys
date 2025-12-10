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
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    dotfiles = {
      url = "git+https://github.com/naurias/dot-nix.git";
      flake = false;
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    #mango = {
    #  url = "github:DreamMaoMao/mango";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    niri = {
      url = "github:sodiboo/niri-flake";
    };
    nvf.url = "github:notashelf/nvf/v0.8";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

  };

  outputs =
    {
      self,
      dotfiles,
      nvf,
      nur,
      stylix,
      niri,
      #mango,
      zen-browser,
      home-manager,
      nixpkgs,
      sops-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        #      "aarch64-linux"
        #      "i686-linux"
        "x86_64-linux"
        #      "aarch64-darwin"
        #      "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };
      homeManagerModules = import ./modules/home-manager;
      nixosConfigurations = {
        nixreaper = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          system = "x86_64-linux";
          modules = [
            ./hosts/nixreaper
            nvf.nixosModules.default
            stylix.nixosModules.stylix
            #inputs.mango.nixosModules.mango
            niri.nixosModules.niri
            ./overlays/niri-overlay.nix
            #./modules/sys-modules/mangosys.nix
            inputs.dankMaterialShell.nixosModules.dankMaterialShell
            nur.modules.nixos.default
            nur.legacyPackages.x86_64-linux.repos.iopq.modules.xraya
            sops-nix.nixosModules.sops

          ];
        };
      };
      homeConfigurations = {
        "nix@nixreaper" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/nix/nixreaper.nix
            #./modules/home-manager/mango.nix
            #inputs.mango.hmModules.mango
          ];
        };
      };

    };
}
