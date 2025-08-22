{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      vim-nix
      telescope-nvim
      (nvim-treesitter.withPlugins (p: [
        p.python
        p.nix 
      ]))
      lualine-nvim
      gruvbox-nvim
      nvim-web-devicons
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      luasnip
      friendly-snippets
      cmp_luasnip
      vimtex
      cmp-vimtex
    ];

    extraLuaConfig = ''
      vim.opt.number = true
      vim.opt.relativenumber = false
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 2
      vim.opt.expandtab = true
      vim.opt.termguicolors = true
      vim.opt.mouse = "a"
      vim.opt.clipboard = "unnamedplus"
      vim.o.background = "dark" 
      vim.cmd([[colorscheme gruvbox]])
      require("lualine").setup {
        options = {
          theme = "gruvbox",
          section_separators = "",
          component_separators = ""
        }
      }

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    -- Enter confirma la sugerencia si hay una entrada seleccionada, si no la hay, salta la linea
    ["<CR>"] = cmp.mapping(function(fallback)
  if cmp.visible() and cmp.get_selected_entry() then
    cmp.confirm({ select = false })
  else
    fallback() -- hace el salto de línea normal
  end
end, { "i", "s" }),
    -- Shift+Enter navega las sugerencias (next)
    ["<S-CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Tab expande o salta en snippets
    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Shift+Tab salta hacia atrás en snippets
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  })
})

      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true
        }
      }

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({})
      lspconfig.ts_ls.setup({})

      -- Configurar ruta de snippets personalizados
      require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/snippets"
    })



    '';
  };
}

