{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ## Multimedia
    # audacity
    # gimp
    media-downloader
    # obs-studio
    # pavucontrol
    # soundwireserver
    # video-trimmer
    vlc

    ## Office
    onlyoffice
    gnome-calculator

    ## Utility
    dconf-editor
    gnome-disk-utility
    mission-center # GUI resources monitor
    zenity
    calibre
    bitwarden-desktop
    joplin-desktop

    ## Level editor
    ldtk
    tiled
  ];
}
