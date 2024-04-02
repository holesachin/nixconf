return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  'folke/tokyonight.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function() 
      require('tokyonight').setup({
        style = "night",
        transparent = true,

      -- lualine
      lualine = {
        transparent = true,
      },

      })
    require('tokyonight').load()
    end,
    opts = {
      style = 'night',
  },
}
