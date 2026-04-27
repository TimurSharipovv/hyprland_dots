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
})
