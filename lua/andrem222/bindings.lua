local keymap = vim.keymap

-- Telescope Bindings
keymap.set('n', '\\t', '<Cmd>BrowseFiles<CR>', { silent = true, desc = Msgstr("Browse Files") })
keymap.set('n', '\\r', '<Cmd>ResumeSearch<CR>', { silent = true, desc = Msgstr("Resume Search") })
keymap.set('n', '\\f', '<Cmd>FileParse<CR>', { silent = true, desc = Msgstr("File Parse") })
keymap.set('n', '\\l', '<cmd>Telescope live_grep<cr>', { silent = true, desc = Msgstr("Live Grep") })
keymap.set('n', '\\w', '<Cmd>Telescope diagnostics<CR>', { silent = true, desc = Msgstr("Show Diagnostics") })
keymap.set('n', '\\g', '<Cmd>Telescope git_status<CR>', { silent = true, desc = Msgstr("Git Status") })
keymap.set('n', '\\\\', '<Cmd>Telescope buffers<CR>', { silent = true, desc = Msgstr("Show Buffers") })
keymap.set('n', '<F3>', '<Cmd>Telescope help_tags<CR>', { silent = true, desc = Msgstr("Show Help Tags") })
keymap.set('n', '<F4>', '<Cmd>Telescope keymaps<CR>', { silent = true, desc = Msgstr("Show Keymaps") })
keymap.set('n', '<F5>', '<Cmd>Telescope notify<CR>', { silent = true, desc = Msgstr("Show Notifications") })

-- Installations
keymap.set('n', '<S-Home>', '<Cmd>Mason<CR>', { silent = true, desc = Msgstr("Open Mason") })
keymap.set('n', '<Home>', '<Cmd>Lazy<CR>', { silent = true, desc = Msgstr("Open Lazy") })

-- Status
keymap.set('n', '<F6>', '<Cmd>LspInfo<CR>', { silent = true, desc = Msgstr("LSP Info") })
keymap.set('n', '<F7>', '<Cmd>NullLsInfo<CR>', { silent = true, desc = Msgstr("NullLS Info") })

-- Moving Selections
keymap.set({ 'n', 'i' }, '<A-Down>', '<Esc>:m .+1<CR>==', { silent = true, desc = Msgstr("Move Selection Down") })
keymap.set({ 'n', 'i' }, '<A-Up>', '<Esc>:m .-2<CR>==', { silent = true, desc = Msgstr("Move Selection Up") })
keymap.set('v', '<A-Down>', [[:m '>+1<CR>gv=gv]], { silent = true, desc = Msgstr("Move Selection Down") })
keymap.set('v', '<A-Up>', [[:m '<-2<CR>gv=gv]], { silent = true, desc = Msgstr("Move Selection Up") })

keymap.set({ 'n', 'i' }, '<A-Left>', '<Esc><<', { desc = Msgstr("Move Selection Left") })
keymap.set({ 'n', 'i' }, '<A-Right>', '<Esc>>>', { desc = Msgstr("Move Selection Right") })
keymap.set('v', '<A-Left>', '<gv', { desc = Msgstr("Move Selection Left") })
keymap.set('v', '<A-Right>', '>gv', { desc = Msgstr("Move Selection Right") })

-- Bufferline Bindings
keymap.set('n', '<S-q>', '<Cmd>bdelete<CR>', { desc = Msgstr("Close Buffer") })
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR> {}', { desc = Msgstr("Next Buffer") })
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR> {}', { desc = Msgstr("Previous Buffer") })

-- Comment Binding
keymap.set({ 'i', 'n' }, '<C-_>', '<ESC><Plug>(comment_toggle_linewise_current)', { desc = Msgstr("Toggle Comment") })
keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)', { desc = Msgstr("Toggle Comment") })
keymap.set('x', '<C-A-_>', '<Plug>(comment_toggle_blockwise_visual)', { desc = Msgstr("Toggle Comment") })

-- Format Bindings
keymap.set({ 'v', 'n', 'i' }, '<S-A-f>', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', { desc = Msgstr("Format") })

-- Lspsaga Setup
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { desc = Msgstr("Show Hover") })
keymap.set('n', '<A-k>', '<Cmd>Lspsaga peek_definition<CR>', { desc = Msgstr("Peek Definition") })
keymap.set('n', '<C-k>', '<Cmd>Lspsaga goto_definition<CR>', { desc = Msgstr("Go to Definition") })
keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', { desc = Msgstr("Find References and Implementations") })
keymap.set('n', 'gp', '<Cmd>Lspsaga code_action<CR>', { desc = Msgstr("Code Action") })
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = Msgstr("Jump to Next Diagnostic") })
keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = Msgstr("Jump to Previous Diagnostic") })
keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', { desc = Msgstr("Show Line Diagnostics") })

-- Inc Rename
keymap.set('n', 'gr',function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
end, { expr = true, desc = Msgstr("Rename") })

-- Split window
keymap.set("n", "ss", ":split<Return>", { noremap = true, silent = true, desc = Msgstr("Horizontal Split Window") })
keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true, desc = Msgstr("Vertical Split Window") })

-- Move window
keymap.set("n", "sh", "<C-w>h", { desc = Msgstr("Move to Left Window") })
keymap.set("n", "sk", "<C-w>k", { desc = Msgstr("Move to Upper Window") })
keymap.set("n", "sj", "<C-w>j", { desc = Msgstr("Move to Lower Window") })
keymap.set("n", "sl", "<C-w>l", { desc = Msgstr("Move to Right Window") })

-- Resize panes
keymap.set('n', '<C-A-h>', '<Cmd>vertical resize -4<CR>', { desc = Msgstr("Resize Pane Left") })
keymap.set('n', '<C-A-k>', '<Cmd>resize +4<CR>', { desc = Msgstr("Resize Pane Up") })
keymap.set('n', '<C-A-j>', '<Cmd>resize -4<CR>', { desc = Msgstr("Resize Pane Down") })
keymap.set('n', '<C-A-l>', '<Cmd>vertical resize +4<CR>', { desc = Msgstr("Resize Pane Right") })

-- DAP Bindings
keymap.set('n', '<F10>', '<Cmd>DapContinue<CR>', { desc = Msgstr("Debug Continue") })
keymap.set('n', '<F11>', '<Cmd>DapStepOver<CR>', { desc = Msgstr("Debug Step Over") })
keymap.set('n', '<F12>', '<Cmd>DapStepInto<CR>', { desc = Msgstr("Debug Step Into") })
keymap.set('n', '<F13>', '<Cmd>DapStepOut<CR>', { desc = Msgstr("Debug Step Out") })
keymap.set('n', '\\bb', '<Cmd>DapToggleBreakpoint<CR>', { desc = Msgstr("Toggle Breakpoint") })
keymap.set('n', '\\bc', [[<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>]],
    { desc = Msgstr("Toggle Conditional Breakpoint") })
keymap.set('n', '\\bl', [[<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]],
    { desc = Msgstr("Toggle Log Point Breakpoint") })
keymap.set('n', '\\bu', [[<Cmd>lua require'dapui'.toggle()<CR>]], { desc = Msgstr("Toggle Debug UI") })

-- Copy and Delete Bindings
keymap.set("x", "\\p", [["_dP]], { desc = Msgstr("Paste Without Copying") })

keymap.set({"n", "v"}, "\\d", [["_d]], { desc = Msgstr("Delete Without Copying") })

-- Folds
keymap.set('n', '+', '<Cmd>foldopen<CR>', { desc = Msgstr("Open Fold") })
keymap.set('n', '_', '<Cmd>foldclose<CR>', { desc = Msgstr("Close Fold") })
keymap.set('n', '<A-=>', '<Cmd>OpenAllFolds<CR>', { desc = Msgstr("Open All Folds") })
keymap.set('n', '<A-->', '<Cmd>CloseAllFolds<CR>', { desc = Msgstr("Close All Folds") })

-- Ctrl Movement
keymap.set({ 'n', 'v' }, '<C-Right>', 'E', { desc = Msgstr("Move to End of Word") })
keymap.set('i', '<C-Right>', '<C-o>E<Right>', { desc = Msgstr("Move to End of Word") })

-- Deselect
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = Msgstr("Escape and clear hlsearch") })

-- Terminal
keymap.set('t', "<esc>", "<C-\\><C-n>", { desc = Msgstr("Exit Terminal Mode") })
