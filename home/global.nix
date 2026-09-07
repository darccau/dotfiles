{
  config,
  pkgs,
  ...
}:
{
  home = {
    sessionPath = [ "$HOME/.local/bin" ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --border";
    };

    packages = with pkgs; [
      # core CLI
      bat
      eza
      fd
      fzf
      ripgrep
      tree
      jq
      delta
      zoxide
      gh

      # terminals / editors
      ghostty
      zathura
      radare2
      gdb
      hunk
      lazygit
      tmux
      prettier

      # scripting & shells
      rlwrap
      xclip
      python3
      netcat-openbsd
      file
      binutils
      strace
      ltrace
    ];
  };

  programs.bat.enable = true;
  programs.eza.enable = true;
  programs.zoxide.enable = true;

  xdg.enable = true;
}
