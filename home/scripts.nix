{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.dotfiles) repoDir notesDir seclistsDir;

  mkScript =
    name: runtimeInputs:
    pkgs.writeShellApplication {
      inherit name runtimeInputs;
      text =
        builtins.replaceStrings
          [ "@NOTES@" "@SECLISTS@" "@REPO@" ]
          [
            notesDir
            seclistsDir
            repoDir
          ]
          (builtins.readFile ./scripts/${name}.sh);
    };

  scripts = {
    __agenda = mkScript "__agenda" [
      pkgs.fzf
      pkgs.neovim
      pkgs.findutils
      pkgs.coreutils
      pkgs.gawk
      pkgs.gnused
    ];
    __open_file_git = mkScript "__open_file_git" [
      pkgs.git
      pkgs.fzf
      pkgs.bat
      pkgs.neovim
      pkgs.coreutils
      pkgs.findutils
      pkgs.gawk
      pkgs.gnused
    ];
    __select_note = mkScript "__select_note" [
      pkgs.findutils
      pkgs.fzf
      pkgs.neovim
    ];
    __select_wordlist = mkScript "__select_wordlist" [
      pkgs.findutils
      pkgs.fzf
      pkgs.tmux
    ];
    __sessionizer = mkScript "__sessionizer" [
      pkgs.tmux
      pkgs.fzf
      pkgs.zoxide
      pkgs.fd
      pkgs.findutils
      pkgs.coreutils
      pkgs.gnused
      pkgs.gawk
    ];
    __snippets = mkScript "__snippets" [
      pkgs.fzf
      pkgs.coreutils
    ];
    __access_scriptlib = mkScript "__access_scriptlib" [
      pkgs.findutils
      pkgs.fzf
      pkgs.neovim
    ];
  };
in
{
  options.dotfiles.scriptPackages = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
    internal = true;
  };

  config.dotfiles.scriptPackages = scripts;

  config.home.packages = builtins.attrValues scripts;
}
