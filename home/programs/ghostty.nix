{
  pkgs,
  ...
}:
{
  xdg.configFile."ghostty/shaders/cursor_warp.glsl".source = ./cursor_warp.glsl;

  programs.ghostty = {
    enable = true;

    settings = {
      "font-family" = "BerkeleyMono Nerd Font";
      "font-size" = 13;
      "shell-integration-features" = "no-cursor,sudo,no-title";
      "cursor-style" = "block";
      "adjust-cell-height" = "35%";
      "background-opacity" = 0.96;
      "mouse-hide-while-typing" = true;
      "mouse-scroll-multiplier" = 2;
      "window-padding-balance" = true;
      "window-save-state" = "always";
      "background" = "1a1b26";
      keybind = [
        "cmd+s>r=reload_config"
        "cmd+s>x=close_surface"
      ];
      "copy-on-select" = "clipboard";
      "custom-shader" = "shaders/cursor_warp.glsl";
    }
    // pkgs.lib.optionalAttrs pkgs.stdenv.hostPlatform.isDarwin {
      "macos-titlebar-style" = "transparent";
      "window-colorspace" = "display-p3";
    };
  };
}
