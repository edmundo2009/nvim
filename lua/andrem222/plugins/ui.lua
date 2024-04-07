return {
    {
        'nvim-lualine/lualine.nvim', -- Status Line
        config = function()
            local cozynight = require('lualine.themes.palenight')

            cozynight.insert.a.bg = '#f7397c'
            cozynight.insert.b.fg = '#f7397c'
            cozynight.visual.a.bg = '#ffb86c'
            cozynight.visual.b.fg = '#ffb85c'

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = cozynight,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff',
                        {
                            'diagnostics',
                            sources = { "nvim_diagnostic" },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                        }
                    },
                    lualine_c = { 'filename' },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has,
                            color = { fg = "#ffb85c" },
                        },
                        'encoding',
                        'fileformat',
                        'filetype'
                    },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            })
        end
    },
    { 'kyazdani42/nvim-web-devicons' },                      -- Icons
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- Indent Line
    {
        'Mofiqul/dracula.nvim', -- Theme
        lazy = true,
        priority = 1000,
    },
    {
        'glepnir/dashboard-nvim', -- Menu Screen
        config = function()
            require("dashboard").setup({
                config = {
                    header = {
                        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
                        '                                                       ',
                    },
                    shortcut = {
                        {
                            desc = ' Files',
                            group = 'Label',
                            action = 'BrowseFiles',
                            key = 'f',
                        },
                        {
                            desc = ' Keymaps',
                            group = 'DiagnosticHint',
                            action = 'Telescope keymaps',
                            key = 'k',
                        },
                        {
                            desc = ' Dotfiles',
                            group = 'Number',
                            action = 'Telescope file_browser cwd='..vim.fn.stdpath("config").."/lua/andrem222", -- Change to your dotfiles path
                            key = 'd',
                        },
                        {
                            desc = '󰝒 New File',
                            group = 'DiagnosticWarn',
                            action = 'ene ',
                            key = 'e',
                        }
                    },
                    packages = { enable = false },
                    footer = {
                        "",
                        "NVIM v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    }
                }
            })
        end
    },
    { 'rrethy/vim-illuminate' }, -- Highlight
    {
        "kevinhwang91/nvim-ufo", -- Aesthetic Folding
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead",
        config = function()
            local ibl = require("ibl")

            local ufo = require("ufo")

            ufo.setup()

            vim.api.nvim_create_user_command(
                "OpenAllFolds",
                function()
                    ufo.openAllFolds()
                end,
                { nargs = 0 }
            )

            vim.api.nvim_create_user_command(
                "CloseAllFolds",
                function()
                    ufo.closeAllFolds()
                end,
                { nargs = 0 }
            )

            ibl.setup({
                scope = {
                    show_start = false,
                    show_end = false
                },
                exclude = {
                    filetypes = {
                        "dashboard"
                    }
                }
            });
        end,
    },
    {
        'NvChad/nvim-colorizer.lua', -- Color Highlight
        config = function()
            require('colorizer').setup({
                user_default_options = { css = true, mode = "virtualtext", virtualtext = "󱓻", }
            })
        end,
    },
    {
        "b0o/incline.nvim", -- Floating Statusline
        event = "BufReadPre",
        priority = 1200,
        config = function()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guifg = "#ffffff" },
                        InclineNormalNC = { guifg = "#44475A" },
                    },
                },
                window = { margin = { vertical = 0, horizontal = 0 } },
                hide = {
                    cursorline = true,
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                        filename = "[+] " .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { " " }, { filename } }
                end,
            })
        end,
    },
    {
        "folke/noice.nvim", -- UI For Messages, CMDLine, and Popmenu
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        config = function()
            local root = vim.fn.fnamemodify("./.repro", ":p")

            -- Notify Setup
            require("notify").setup({ background_colour = "#000000" })

            -- bootstrap lazy
            local lazypath = root .. "/plugins/lazy.nvim"
            if not vim.loop.fs_stat(lazypath) then
                vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath, })
            end
            vim.opt.runtimepath:prepend(lazypath)

            -- Noice Setup
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false,        -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                }
            })
        end
    },
    {
        'akinsho/nvim-bufferline.lua', -- Buffer Tabs
        event ="VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = ""

                        if level:match("error") then
                            icon = ""
                        elseif level:match("warning") then
                            icon = ""
                        end

                        return " " .. icon
                    end
                },
                highlights = {
                    modified = { fg = '#ffb86c' },
                    modified_selected = { fg = '#ffb86c' },
                    buffer_selected = { italic = false },
                    diagnostic_selected = { italic = false },
                    hint_selected = { italic = false },
                    hint_diagnostic_selected = { italic = false },
                    info_selected = { italic = false },
                    warning_selected = { italic = false },
                    warning_diagnostic_selected = { italic = false },
                    error_selected = { italic = false },
                    error_diagnostic_selected = { italic = false },
                },
            })
        end,

    },
}
