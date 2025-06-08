-- basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
-- vim.cmd.colorscheme("tokyonight")
vim.g.mapleader = " "

-- bootstrap lazy.nvim plugin manager
-- build and install lua5.1
-- brew install luajit
-- brew install luarocks
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins
local plugins = {
  -- luarocks
  { 
    "vhyrro/luarocks.nvim",
    priority = 2000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  -- color themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {}
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate"
  },
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}

local opts = {}

require("lazy").setup(plugins, opts)
-- require("lazy").setup({
--  "nvim-lualine/lualine.nvim",
--  "nvim-tree/nvim-tree.lua",
--})

-- tokyonight setup
vim.cmd[[colorscheme tokyonight]]

-- lualine setup
-- require("lualine").setup()

-- nvim-tree setup (file explorer)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- require("nvim-tree").setup()

-- keymap
vim.keymap.set("n", "<Leader>n", ":nohlsearch<CR>", { silent = true })

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- tree-sitter
-- swift requires tree-sitter-cli
-- brew install npm
-- npm install -g tree-sitter-cli
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "asm", "c", "cpp", "javascript", "lua", "objc", "python", "swift", "tmux", "toml", "typescript", "vim", "vimdoc", "markdown", "markdown_inline", "xml" },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  -- npm install tree-sitter-cli
  auto_install = true,
  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = { enable = true },
  indent = { enable = true },
}
