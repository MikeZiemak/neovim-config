return {
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      on_open = function(win)
        local config = vim.api.nvim_win_get_config(win)
        config.border = "single"
        vim.api.nvim_win_set_config(win, config)
      end,
    },
  },
  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    --    lazy = true,
    --  {
    --      "LazyVim/LazyVim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      sidebars = { "qf", "vista_kind", "terminal", "packer" },
    },
  },

  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",

    opts = {
      transparent_mode = true,
      styles = {
        sidebars = "transparent",
      },
    },
  },
  --  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "go",
        "terraform",
        "gomod",
        "gosum",
        "gowork",
      })
    end,
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
      virtual_text = false,
      indent_lines = false,
    },
    vim.diagnostic.config({ virtual_text = false }),
  },

  -- add multi-line edition
  {
    "mg979/vim-visual-multi",
  },

  {
    "catppuccin/nvim",
    enabled = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      styles = {
        sidebars = "transparent",
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    }),
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = true,
        borderless_telescope = false,
      })
    end,
  },

  {
    "hashivim/vim-terraform",
  },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   config = function(_, opts)
  --     require("lsp_signature").setup(opts)
  --   end,
  -- },

  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      -- { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        gopls = {},
        terraformls = {},
        bashls = {},
        pyright = {},
      },
      setup = {
        ["*"] = function(server, opts)
          if server == "gopls" then
            opts.settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
              },
            }
          elseif server == "terraformls" then
            opts.settings = {
              terraform = {
                format = {
                  command = "terraform",
                  args = { "fmt", "-" },
                  rootMarkers = { ".terraform", "terraform.hcl" },
                },
              },
              filetypes = { "terraform" },
            }
          end
        end,
      },
    },
  },
}
