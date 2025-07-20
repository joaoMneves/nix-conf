{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Arquivo gerado durante a instalação
    ./laptop.nix
  ];

   # Flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

  # Bootloader 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #silent boot
  # disabledModules = ["system/boot/stage-2.nix" "system/boot/stage-1.nix" "system/etc/etc.nix"];  

  # video acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  # Configurações gerais
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Usuário principal
  users.users.joao = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Pacotes básicos
  environment.systemPackages = with pkgs; [
    wget
    flatpak
    unzip
    wl-clipboard
    libgcc
    gccgo14
  ];
  # install NerdFonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Serviços
  services.openssh.enable = true;
  networking.networkmanager.enable = true;
  nixpkgs.config.allowUnfree = true;

  # flatpak
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  # Adicionar repositório Flathub (opcional mas recomendado)
  services.flatpak.remotes = [
    { name = "flathub"; location = "https://dl.flathub.org/repo/flathub.flatpakrepo"; }
  ];
  services.flatpak.packages = [
    "app.zen_browser.zen"
    "org.onlyoffice.desktopeditors"
    "org.onlyoffice.desktopeditors"
    "io.ente.auth"
  ];

  # Garbage Collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
    };
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = true;
  }; #powers up the default Bluetooth controller on boot

  environment.etc = {
    "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
      bluez_monitor.properties = {
              ["bluez5.enable-sbc-xq"] = true,
              ["bluez5.enable-msbc"] = true,
              ["bluez5.enable-hw-volume"] = true,
              ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      }
    '';
  };

  # Configuração de touchpad
  services.libinput = {
    enable = true;
    touchpad = {
      # naturalScroll = true;
      tapping = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  # Enable Zram
  swapDevices = [
    {
      device = "/swapfile";
      size = 4096;
    }
  ];

  system.stateVersion = "25.05"; 
}
