{
  inputs,
  lib,
  ...
}:
let
  inherit (builtins) attrNames readDir;
  hosts = lib.filter (name: name != ".DS_Store") (attrNames (readDir ../hosts));

  mkHome =
    host:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      lib = inputs.nixpkgs.lib;
      extraSpecialArgs = {
        inherit inputs host;
      };
      modules = [
        inputs.nixvim.homeModules.nixvim
        inputs.agenix.homeManagerModules.age
        {
          # keep nixvim on the same nixpkgs as everything else
          programs.nixvim.nixpkgs.source = inputs.nixpkgs;
        }
        ../home
        ../hosts/${host}/home.nix
      ];
    };
in
{
  flake.homeConfigurations = lib.genAttrs hosts mkHome;
}
