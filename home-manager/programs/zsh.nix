{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkAfter [
    pkgs.zsh
    pkgs.starship
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"
      [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
      [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      source "''${ZINIT_HOME}/zinit.zsh"
      zinit light zsh-users/zsh-syntax-highlighting
      zinit light zsh-users/zsh-autosuggestions
      # Avoid repeating history
      setopt HIST_IGNORE_ALL_DUPS   # Ignore all duplicates in history
      setopt HIST_SAVE_NO_DUPS      # Don't save duplicates to the history file
      setopt HIST_FIND_NO_DUPS      # Don't show duplicates when searching history
      setopt SHARE_HISTORY          # Share history between all sessions
      zinit light marlonrichert/zsh-autocomplete

      export STARSHIP_CONFIG=/etc/nixos/home-manager/programs/conf/starship.toml
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';

    shellAliases = {
      nv = "nvim .";
      ".." = "cd ..";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    };

    history = {
      save = 100000;
      size = 100000;
      #      expireDuplicates = true;
      share = true;
      ignoreSpace = true;
    };
  };

}
