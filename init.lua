if vim.loader then
    vim.loader.enable()
end

_G.dd = function (...)
    require("andrem222.debug")
end

-- Startup settings
require('andrem222.config')

-- Setup Translations
require('andrem222.langMSG')

-- Setup autocmd
require('andrem222.autocmd')

-- Setup Personal Plugins Settings
require('andrem222.devconfig')

-- Lazy setup and plugins
require('andrem222.lazy')

-- Mapping of keys
require('andrem222.bindings')

-- Theme modifications
require('andrem222.theme')
