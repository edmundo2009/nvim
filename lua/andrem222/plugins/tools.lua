return {
    -- Tools
    {
        'nvim-telescope/telescope.nvim', -- File Explorer
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope-ui-select.nvim',
            "nvim-telescope/telescope-file-browser.nvim"
        },
        config = function()
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            local function telescope_buffer_dir()
                return vim.fn.expand('%:p:h')
            end

            local fb_actions = require "telescope".extensions.file_browser.actions
            local themes = require("telescope.themes")

            telescope.setup {
                defaults = {
                    mappings = {
                        n = {
                            ["q"] = actions.close
                        }
                    }
                },

                pickers = {
                    git_status = {
                        prompt_title = Msgstr("Git Status"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    buffers = {
                        prompt_title = Msgstr("Buffers"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    diagnostics = {
                        prompt_title = Msgstr("Workspace Diagnostics"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    help_tags = {
                        prompt_title = Msgstr("Help"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Help Preview")
                    },

                    keymaps = {
                        prompt_title = Msgstr("Keymaps"),
                        results_title = Msgstr("Results"),
                    },

                    live_grep = {
                        prompt_title = Msgstr("Live Grep"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    find_files = {
                        prompt_title = Msgstr("Find Files"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview"),
                        no_ignore = false,
                        hidden = true
                    }
                },
                extensions = {
                    ["ui-select"] = { themes.get_dropdown({}) },

                    file_browser = {
                        theme = "dropdown",
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        initial_mode = "normal",
                        layout_config = { height = 40 },
                        hijack_netrw = true,
                        prompt_title = Msgstr("File Browser"),
                        mappings = {
                            -- Insert
                            ["i"] = {
                                ["<C-w>"] = function() vim.cmd('normal vbd') end,
                            },
                            ["n"] = {
                                -- Custom normal mode mappings
                                ["N"] = fb_actions.create,
                                ["C"] = fb_actions.copy,
                                ["h"] = fb_actions.goto_parent_dir,
                                ["<C-d>"] = fb_actions.remove,
                                ["R"] = fb_actions.rename,
                                ["v"] = actions.select_vertical,
                                ["x"] = actions.select_horizontal,
                                ["/"] = function()
                                    vim.cmd('startinsert')
                                end
                            }
                        }
                    }
                }
            }

            telescope.load_extension("file_browser")
            telescope.load_extension("ui-select")
        end
    },

    {
        'echasnovski/mini.surround',
        version = '*',
        config = function ()
            require('mini.surround').setup({
                mappings = {
                    highlight = '', -- Highlight surrounding
                },
            })
        end
    },
    {
		"smjonas/inc-rename.nvim",
		config = true,
	},
    {
        'glepnir/lspsaga.nvim', -- Tools
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = { separator = "  " },
                ui = {
                    border = 'rounded',
                    code_action = " ",
                    title = false
                }
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim', -- Git Info
        config = function()
            -- set gitsigns
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 100
                },
                current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>'
            })
        end,
    },

    {
        'mfussenegger/nvim-dap', -- Debbuger
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'theHamsta/nvim-dap-virtual-text'
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            dapui.setup()
            require("nvim-dap-virtual-text").setup({})

            vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapUIStop' })
            vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapUIType' })
            vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapUIScope' })
            vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapUIPlayPause' })
            vim.fn.sign_define('DapBreakpointRejected', { text = '󰜺', texthl = 'DapUIStop' })

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
        end,
    }
}
