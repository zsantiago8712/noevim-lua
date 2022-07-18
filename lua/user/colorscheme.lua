local status_ok, colorsheme = pcall(require, "onedark")
if not status_ok then
  return
end




colorsheme.setup  {
  -- Main options --
  style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  toggle_style_key = "<NOP>",
  -- toggle theme style ---
  -- toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

  -- Change code style ---
  -- Options are italic, bold, underline, none
  -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
  code_style = {
    comments = "italic",
    keywords = "italic",
    functions = "bold",
    strings = "none",
    variables = "none",
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {
  }, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
      darker = true, -- darker colors for diagnostic
      undercurl = true,   -- use undercurl instead of underline for diagnostics
      background = true,    -- use background color for virtual text
  },
}

colorsheme.load();





vim.cmd("highlight! link NormalFloat Normal")
vim.cmd("highlight! link FloatBorder Normal")
vim.cmd("highlight! link GuihuaListDark Normal")
vim.cmd("highlight GuihuaListHl guibg=BLACK")
vim.cmd("hi! link GuihuaTextViewDark Normal")




-- NightFox Configs
-- colorsheme.setup({
--   options = {
--     -- Compiled file's destination location
--     compile_path = vim.fn.stdpath("cache") .. "/nightfox",
--     compile_file_suffix = "_compiled", -- Compiled file suffix
--     transparent = true,    -- Disable setting background
--     terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
--     dim_inactive = false,   -- Non focused panes set to alternative background
--   }
-- })

-- -- setup must be called before loading
-- vim.cmd("colorscheme nightfox")
