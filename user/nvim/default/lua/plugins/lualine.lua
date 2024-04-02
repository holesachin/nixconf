--  lualine
return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  -- See `:help lualine.txt`
  lazy = false,
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      section_separators = { left = "🭡", right = "🭅" },
    },
  },
}
