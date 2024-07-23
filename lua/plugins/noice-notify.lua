return {
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    require("noice").setup({
      presets = {
        bottom_search = false,
        command_palette = true,
        lsp_doc_border = true,
      },
    }),
  },
}
