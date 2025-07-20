{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];

  services.udev.packages = with pkgs; [ pkgs.gnome-settings-daemon ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  # services.xserver.desktopManager.gnome = {
  #   extraGSettingsOverrides = '' 
  #     [org.gnome.desktop.input-sources] 
  #     sources=[('xkb', 'br')] 
  #   '';
  #   extraGSettingsOverridePackages = [
  #     pkgs.gsettings-desktop-schemas
  #   ];
  # };
  # dconf.settings."org/gnome/shell" = {
  #   disable-user-extensions = false;
  #   enabled-extensions = with pkgs.gnomeextensions; [
  #     appindicator.extensionuuid
  #     tiling-shell.extensionuuid
  #     # dynamic-pane.extensionuuidl
  #     cronomix.extensionuuid
  #     blur-my-shell.extensionuuid
  #     gsconnect.extensionuuid
  #   ];
  # };
  #
  # environment.systemPackages = with pkgs; lib.mkAfter [
  #   gnomeextensions
  # ];

  environment.gnome.excludePackages = (with pkgs;
    [
      gnome-tour
      gnome-connections
      # snapshot
      gnome-text-editor
      epiphany
      totem
      gnome-music
      geary
      # simple-scan
      seahorse
      # gnome-weather
      gnome-contacts
      gnome-font-viewer
      # gnome-maps
      gnome-console
      gnome-software
      # evince
      yelp
      # gnome-shell-extensions
    ]);

  # kde connect
  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  # gvfs
  services.gvfs.enable = true;

  # Enable NixOS to use fonts from ~/.local/share/fonts
  fonts.fontDir.enable = true;

  # Enable polkit 
  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.startx.enableGnomeKeyring = true;

  # users.extraUsers.tapabratabarick.extraGroups = [ "audio" ];
}
