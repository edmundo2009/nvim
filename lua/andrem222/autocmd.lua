local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yang selection
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Cleanup unintended spaces at the end
local cleanup_group = augroup('CleanupSpaces', {})
autocmd({ "BufWritePre" }, {
    group = cleanup_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Turn off paste mode when leaving insert
local nopaste_group = augroup('DisablePasteMode', {})
autocmd({ "InsertLeave" }, {
    group = nopaste_group,
    pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
local conceallevel_group = augroup('ConcealLvlUpdate', {})
autocmd({ "FileType" }, {
    group = conceallevel_group,
	pattern = { "json", "jsonc", "markdown" },
	callback = function()
		vim.opt.conceallevel = 0
	end,
})
