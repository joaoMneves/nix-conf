
---@type LazySpec
return {
  { "Mofiqul/dracula.nvim", lazy = true },

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "denialofsandwich/sudo.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    config = true,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  -- {
  --   "folke/snacks.nvim",
  --   opts = {
  --     dashboard = {
  --       preset = {
  --         header = table.concat({
  --           " █████  ███████ ████████ ██████   ██████ ",
  --           "██   ██ ██         ██    ██   ██ ██    ██",
  --           "███████ ███████    ██    ██████  ██    ██",
  --           "██   ██      ██    ██    ██   ██ ██    ██",
  --           "██   ██ ███████    ██    ██   ██  ██████ ",
  --           "",
  --           "███    ██ ██    ██ ██ ███    ███",
  --           "████   ██ ██    ██ ██ ████  ████",
  --           "██ ██  ██ ██    ██ ██ ██ ████ ██",
  --           "██  ██ ██  ██  ██  ██ ██  ██  ██",
  --           "██   ████   ████   ██ ██      ██",
  --         }, "\n"),
  --       },
  --     },
  --   },
  -- },

}
