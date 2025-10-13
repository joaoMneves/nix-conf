{ pkgs, ... }:
{
  programs = {
    wl-clipboard.enable = true;

    dconf.enable = true;
    zsh.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      # pinentryFlavor = "";
    };

    nix-ld.enable = true;
    nix-ld.libraries = with pkgs; [ ];
  };
}
