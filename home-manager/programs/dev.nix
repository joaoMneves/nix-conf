{ pkgs, lib, ... }:

{
  home.packages = with pkgs; lib.mkAfter [
    unstable.neovim
    gitui
    nodejs_24
    lua
    python313
    python313Packages.pip
    rustup
    lazygit
    ripgrep
    gnumake
  ];

  programs.neovim = {
    defaultEditor = true;
  };

  xdg.configFile."nvim/init.lua".source = ../../nvim-config/init.lua;
}
