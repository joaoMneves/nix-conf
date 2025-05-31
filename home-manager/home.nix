{ pkgs, inputs, ... }:

{
  imports = [
    ./programs
    ./services
  ];

  home.username = "joao";
  home.homeDirectory = "/home/joao";
  home.stateVersion = "25.05"; # Mantenha compatível com a versão do NixOS

  # Pacotes instalados apenas para o usuário
  home.packages = with pkgs; [
    neofetch
    htop
    home-manager
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "wezterm";
    SHELL = "zsh";
  };

  # Configuração de programas (dotfiles)
  programs = {
    git = {
      enable = true;
      userName = "João Miguel Neves Da silva";
      userEmail = "joaomiguelneves2007@proton.me";
    };

  };

  nixpkgs = {
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

}
