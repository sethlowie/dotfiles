local setup, lualine = pcall(require, "lualine")
if not setup then
  return
end

local my_theme = require("lualine.themes.dracula")

lualine.setup({
  options = {
    theme = my_theme
  }
})
