local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  dev = { -- Import Plugins being developed
    path = "~/.ghq"
  },

  spec = {
    {
      -- This is a plugin folder which contains the requirements for the
      -- plugins which are being developed
      -- { import = "edmundo2009.pluginDev.Plugins" },

      -- This is a plugin folder which contains what I used for my dev environment
      { import = "edmundo2009.plugins" },
    }
  },

  checker = { enable = true },

  install = { colorscheme = { "dracula" } },

  ui = { border = "single" },

  performance = {
    cache = { enabled = true },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "netrwPlugin"
      }
    }
  }
})
