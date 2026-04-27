return require("lazy").setup({
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,         -- загружаем сразу при старте
    priority = 1000,      -- чтобы тема загружалась до остальных
    config = function()
      -- Загрузка самого цвета:
      require("nordic").load()

      -- (опционально, если хочешь настроить параметры):
      -- require("nordic").setup({
      --    bold_keywords = true,
      --    italic_comments = false,
      -- })
    end
  },
  -- Status Bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { 
          theme = 'auto', 
          globalstatus = true, 
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { { 'filename', path = 1 } }, 
          lualine_x = { 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  },
  -- Tabs
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers", 
          separator_style = "thick", 
          show_close_icon = false, 
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            }
          },
        }
      })
    end
  },
  -- Auto complit
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',     
      'hrsh7th/cmp-buffer',       
      'hrsh7th/cmp-path',         
      'L3MON4D3/LuaSnip',         
      'saadparwaiz1/cmp_luasnip', 
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(), 
          ['<C-j>'] = cmp.mapping.select_next_item(), 
          ['<C-e>'] = cmp.mapping.abort(),           
          ['<CR>'] = cmp.mapping.confirm({ select = true }), 
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, 
          { name = 'luasnip' },  
          { name = 'buffer' },   
          { name = 'path' },     
        }),
      })
    end
  },

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  -- File tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
      vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { silent = true })
    end
  },
  -- Улучшенная подсветка синтаксиса (Treesitter)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        -- Список языков, которые нужно установить сразу
        ensure_installed = { "lua", "python", "rust", "bash", "javascript", "markdown", "markdown_inline" },
        
        highlight = {
          enable = true, -- Включить саму подсветку
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true, -- Улучшенные автоматические отступы
        },
      })
    end,
  },
})
