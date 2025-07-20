{ pkgs, lib, ... }:

{
  # home.packages = with pkgs; lib.mkAfter [
  # ];

  home.packages = with pkgs; lib.mkAfter [
    gnomeExtensions.appindicator
    gnomeExtensions.tiling-shell
    # gnomeExtensions.# dynamic-panel
    gnomeExtensions.cronomix
    gnomeExtensions.blur-my-shell
    # gnomeExtensions.gsconnect
  ];

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      # enabled-extensions = with pkgs.gnomeExtensions; [
      #   appindicator
      #   tiling-shell
      #   # dynamic-pane.l
      #   cronomix
      #   blur-my-shell
      #   gsconnect
      # ];
    };
  };
}
