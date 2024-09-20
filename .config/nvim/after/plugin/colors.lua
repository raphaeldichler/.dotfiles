-- Default options
require('nightfox').setup({
  options = {
    colorblind = {
      enable = true,        -- Enable colorblind support
    },
  },
})

vim.cmd("colorscheme nightfox")

