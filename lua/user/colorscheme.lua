local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end


nightfox.setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")