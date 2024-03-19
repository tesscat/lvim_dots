-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

local home_dir = os.getenv("HOME")
package.path = home_dir .. "/.config/lvim/?.lua;" .. package.path

require "custom.maps"

require "custom.plugins"

lvim.colorscheme = "catppuccin"

require "custom.dash"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.number = false
vim.opt.relativenumber = false

-- --
-- lvim.builtin.alpha.dashboard.section.header.val = function ()
--   return "oh there"
-- end
