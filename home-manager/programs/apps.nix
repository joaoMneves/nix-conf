{ pkgs, lib, ... }:

{
  home.packages = with pkgs; lib.mkAfter [
    calibre
    bitwarden-desktop
    joplin-desktop
  ];

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./conf/wezterm.lua;
  };

}
