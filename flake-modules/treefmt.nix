{
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.treefmt-nix.flakeModule
  ];

  perSystem =
    {
      ...
    }:
    {
      treefmt = {
        projectRootFile = "flake.nix";
        settings.global.excludes = [
          "flake.lock"
          "secrets/*.age"
          "assets/**/*.toml"
        ];
        programs.nixfmt.enable = true;
        programs.shfmt.enable = true;
        programs.prettier.enable = true;
      };
    };
}
