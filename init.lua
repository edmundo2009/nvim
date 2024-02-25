if vim.loader then
    vim.loader.enable()
end

_G.dd = function (...)
    require("andrem222.debug")
end

-- Startup settings
require('andrem222.config')

-- Lazy setup and plugins
require('andrem222.lazy')

-- Theme modifications
require('andrem222.theme')

-- Mapping of keys
require('andrem222.bindings')

vim.cmd('colorscheme dracula')
