{ inputs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];


  services.flatpak = {
    enable = false;
    remotes = [
      { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
    ];

    packages = [
      "com.github.tchx84.Flatseal"
      "app.zen_browser.zen"
      # "org.onlyoffice.desktopeditors"
      "io.ente.auth"

    ];
    overrides = {
      global = {
        # Force Wayland by default
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
      };
    };
  };
}
