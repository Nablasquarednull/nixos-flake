{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-cmp
      tokyonight-nvim
      luasnip
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      friendly-snippets
      vimtex
      nvim-treesitter.withAllGrammars
    ];

    extraLuaConfig = ''
      -- VimTeX
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_syntax_enabled = 1

      -- Snippet loader
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { os.getenv("HOME") .. "/.config/nvim/snippets" }
      })

      -- Luasnip + CMP config
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      luasnip.config.set_config({
        enable_autosnippets = true,
        update_events = "TextChanged,TextChangedI",
      })

      cmp.setup({
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            elseif cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })

      -- Opciones básicas
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
      vim.opt.expandtab = true
      vim.opt.smartindent = true
      vim.opt.termguicolors = true
      vim.cmd[[colorscheme tokyonight]]
    '';
  };
}

