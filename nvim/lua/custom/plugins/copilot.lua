return {
  -- {
  --   'zbirenbaum/copilot.lua',
  --   lazy = true, -- Make it fully lazy loaded, seems to cause slow startup?
  --   cmd = 'Copilot', -- Keep this to make it accessible via command
  --   config = function()
  --     require('copilot').setup {}
  --   end,
  -- },
  {
    'github/copilot.vim',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      log_level = 'DEBUG',
    },
    config = function()
      local cc = require 'codecompanion'
      cc.setup {
        display = {
          chat = {
            window = {
              layout = 'float',
              height = 0.8,
              width = 0.8,
            },
          },
        },
        adapters = {
          http = {
            opts = {
              show_model_choices = true,
            },
            copilot = function()
              return require('codecompanion.adapters').extend('copilot', {
                schema = {
                  model = {
                    default = 'claude-sonnet-4.5',
                  },
                },
              })
            end,
          },
        },
        strategies = {
          chat = {
            adapter = copilot,
          },
          inline = {
            adapter = copilot,
          },
        },
      }
      vim.keymap.set('n', '<leader>a', cc.toggle, { silent = true })
      vim.keymap.set('v', '<leader>a', ':CodeCompanionChat Add<CR>')
    end,
  },
}
