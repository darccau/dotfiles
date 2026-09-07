{
  lib,
  ...
}:
{
  options.dotfiles = {
    repoDir = lib.mkOption {
      type = lib.types.str;
      default = "~/Documents/dotfiles";
      description = "Path to this dotfiles repository (used by scripts that browse it).";
    };

    notesDir = lib.mkOption {
      type = lib.types.str;
      default = "~/Documents/notes";
      description = "Path to the agenda / notes vault.";
    };

    seclistsDir = lib.mkOption {
      type = lib.types.str;
      default = "~/Public/SecLists";
      description = "Path to the SecLists wordlists directory.";
    };
  };
}
