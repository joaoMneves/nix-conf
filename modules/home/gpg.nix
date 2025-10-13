{ pkgs, ... }: {

  gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
