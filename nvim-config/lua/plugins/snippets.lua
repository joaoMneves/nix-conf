return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"

      luasnip.snippets = {
        html = {
          luasnip.parser.parse_snippet(
            "html5",
            '<!DOCTYPE html>\n<html lang="pt-BR">\n<head>\n<meta charset="UTF-8">\n<meta name="viewport" content="width=device-width, initial-scale=1.0">\n<title>${1:Documento}</title>\n</head>\n<body>\n$0\n</body>\n</html>'
          ),
        },
      }
      require("luasnip.loaders.from_vscode").lazy_load {}
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
}
