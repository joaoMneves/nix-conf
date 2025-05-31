{ pkgs, lib, ... }:

{
  home.packages = with pkgs; lib.mkAfter [
  ];

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
    settings."org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        appindicator.extensionUuid
        tiling-shell.extensionUuid
        # dynamic-pane.extensionUuidl
        cronomix.extensionUuid
        blur-my-shell.extensionUuid
        gsconnect.extensionUuid
      ];
    };
    # settings."org/gnome/desktop/input-sources" = {
    # sources = [ (mkTuple [ "xkb" "br" ]) ];
    # xkb-options = [ ];
  # };
  };

}
