{
  ...
}:
{
  home.file.".gitignore" = {
    text = ''
      # Nix
      result*
      .secrets/

      # Age secrets (encrypted files ARE tracked; keys are not)
      *.age
      !secrets/*.age

      # OS cruft
      .DS_Store
      ._*
    '';
  };

  programs.git = {
    enable = true;

    signing = {
      key = "E81C148A60871F34!";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "darccau";
        email = "darccau@gmail.com";
      };

      alias = {
        a = "!git status --short | fzf | awk '{print $2}' | xargs git add";
        s = "status --short";
        uncommit = "reset --soft HEAD^";
        unstage = "reset HEAD";
        up = "commit -a --amend --no-edit";
        bn = "branch --no-merged";
        df = "!git hist | fzf | awk '{print $2}' | xargs -I {} git diff {}^ {}";
        hist = "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all";
        llog = "log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative";
        find = "!f() { git log --pretty=format:\"%h %cd [%cn] %s%d\" --date=relative -S'pretty' -S\"$@\" | fzf | awk '{print $1}' | xargs -I {} git diff {}^ {}; }; f";
        conflicts = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; nvim `f`";
        add-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`";
      };

      core = {
        excludesfile = "~/.gitignore";
        pager = "delta";
        editor = "nvim";
      };

      color = {
        status = "auto";
        diff = "auto";
        branch = "auto";
        interactive = "auto";
        grep = "auto";
        ui = "auto";
      };

      interactive = {
        diffFilter = "delta --color-only";
      };

      commit = {
        gpgsign = true;
      };

      gpg = {
        format = "openpgp";
      };
    };
  };
}
