{ ... }:
{


  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
  };
  xdg.configFile."nvim/init.lua".source = ../../nvim-config/init.lua;

}
