return {
  {
    "folke/trouble.nvim",
    opts = {
      use_diagnostic_signs = true,
      virtual_text = false,
      indent_lines = false,
    },
    vim.diagnostic.config({ virtual_text = false }),
  },
}
