{ inputs, pkgs, ... }:
{
  # hyprland
  wayland.windowManager.hyprland = {
    enable = true;
  systemd.enable = false;
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };

  xdg.configFile."hypr" = {
    source = ./conf/hypr/hypr;
    recursive = true;
  };

  xdg.configFile."waybar" = {
    source = ./conf/hypr/waybar;
    recursive = true;
  };

  xdg.configFile."rofi" = {
    source = ./conf/hypr/rofi;
    recursive = true;
  };


}
