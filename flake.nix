{
  description = "Nix-managed dotfiles — declarative home configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];

      imports = [
        ./flake-modules/home-manager.nix
        ./flake-modules/treefmt.nix
      ];

      perSystem =
        {
          inputs',
          pkgs,
          ...
        }:
        {
          packages.agenix = inputs'.agenix.packages.agenix;

          devShells.default = pkgs.mkShell {
            packages = [
              pkgs.just
              pkgs.age
              pkgs.nixfmt-rfc-style
              inputs'.agenix.packages.agenix
            ];
          };
        };
    };
}
