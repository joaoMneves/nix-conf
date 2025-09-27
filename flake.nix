{
  description = "NixOS Configuration for João";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          # Overlay para adicionar pacotes instáveis como `pkgs.unstable`
          ({ config, pkgs, ... }: {
            nixpkgs.overlays = [
              (final: prev: {
                unstable = nixpkgs-unstable.legacyPackages.x86_64-linux;
              })
            ];
          })

          # Módulo principal do NixOS
          ./nixos/configuration.nix


          # modulos
          ./mods/podman.nix

          # Integração com o Home Manager no NixOS
          home-manager.nixosModules.home-manager

          # nix-flatpak.nixosModules.nix-flatpak

          # Opcional: garantir que o Home Manager use os mesmos argumentos
          {
            home-manager.useGlobalPkgs = true;
            # home-manager.useUserPackages = true;
            users.users.joao.home = "/home/joao";
            home-manager.users.joao = import home-manager/home.nix;
          }
        ];

        specialArgs = { inherit inputs; };
      };
    };

    homeConfigurations = {
      "joao@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}

