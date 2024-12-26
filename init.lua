if vim.loader then
	vim.loader.enable()
end

_G.dd = function (...)
  require("edmundo2009.debug")
end

-- Startup settings
require('edmundo2009.config')

-- Setup Translations
require('edmundo2009.langMSG')

-- Setup autocmd
require('edmundo2009.autocmd')

-- Setup Personal Plugins Settings
require('edmundo2009.devconfig')

-- Lazy setup and plugins
require('edmundo2009.lazy')

-- Mapping of keys
require('edmundo2009.bindings')

-- Theme modifications
require('edmundo2009.theme')
