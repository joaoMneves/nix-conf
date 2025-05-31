{ inputs, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  # wayland.windowManager.hyprland.systemd.enable = false;

  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      # defaultSession = "hyprland";  # Sessão padrão
    };
  };
  # Variáveis de ambiente
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  environment.systemPackages = with pkgs; [
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper

    waybar
    rofi

    wl-clipboard
    # grim
    # slurp

  ];



}
