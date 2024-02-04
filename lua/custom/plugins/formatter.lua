return {
  'mhartington/formatter.nvim',
  config = function()
    require('formatter').setup {
      -- Enable or disable logging
      logging = true,
      -- Set the log level
      log_level = vim.log.levels.WARN,
      filetype = {
        typescriptreact = {
          require('formatter.filetypes.typescriptreact').prettier
        },
        typescript = {
          require('formatter.filetypes.typescript').prettier
        },
        javascript = {
          require('formatter.filetypes.javascript').prettier
        }
      }
    }
  end
}
