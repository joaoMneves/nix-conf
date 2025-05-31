{ config, pkgs, ... }:
{
  programs.waybar.enable = true;

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 26;
      output = [
        "eDP-1"
      ];

      modules-left = [ "custom/logo" "sway/workspaces" "sway/mode" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [  "clock" "battery" ];

      "custom/logo" = {
        format = "";
        tooltip = false;
        on-click = ''bemenu-run --accept-single  -n -p "Launch" --hp 4 --hf "#ffffff" --sf "#ffffff" --tf "#ffffff" '';
      };

      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        persistent_workspaces = {
          "1" = [ ];
          "2" = [ ];
          "3" = [ ];
          "4" = [ ];
        };
        disable-click = true;
      };

      "sway/mode" = {
        tooltip = false;
      };

      # "sway/language" = {
      #   format = "{shortDescription}";
      #   tooltip = false;
      #   on-click = ''swaymsg input "1:1:AT_Translated_Set_2_keyboard" xkb_switch_layout next'';
      #
      # };

      "clock" = {
        interval = 60;
        format = "{:%a %d/%m %I:%M}";
      };

      "battery" = {
        tooltip = true;
      };
    };
  };

  xdg.configFile."waybar" = {
    source = ./conf/waybar;
    recursive = true;
  };

}
