-- PLUGINS and some settings for them

lvim.plugins = {
    { -- jump to places quickly!
        "ggandor/leap.nvim",
        name = "leap",
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    { -- show line numbers only when needed
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
                hide_relativenumbers = true,
            }
        end,
    },
    { -- visual file manager in floaty window
        "kevinhwang91/rnvimr",
        cmd = "RnvimrToggle",
        config = function()
            vim.g.rnvimr_draw_border = 1
            vim.g.rnvimr_pick_enable = 1
            vim.g.rnvimr_bw_enable = 1
        end,
    },
    { -- ripgrep search <3
        "camspiers/snap",
        rocks = "fzy",
        config = function()
            local snap = require "snap"
            snap.maps {
                {"<Leader><Leader>", snap.config.file {producer = "ripgrep.file"}},
                {"<Leader>fb", snap.config.file {producer = "vim.buffer"}},
                {"<Leader>fo", snap.config.file {producer = "vim.oldfile"}},
                {"<Leader>ff", snap.config.vimgrep {}},
            }
        end,
    },
    { -- % for language-specific vocab
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    { -- view git diffs nicely
        "sindrets/diffview.nvim",
        event = "BufRead",
    },
    { -- git fugitive
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = {"fugitive"}
    },
    { -- autoclose html tags (+jsx, tsx, etc etc)
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    { -- gay parentheses
        "hiphish/rainbow-delimiters.nvim",
    },
    { -- change commentstring based on location in file, useful for like
        -- html, where you can have // in <script> or /* for css or <!--
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "BufRead",
    },
    { -- show fn name at top if it clips offscreen
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },
    { -- fuzzy style telescoping
        "nvim-telescope/telescope-fzy-native.nvim",
        build = "make",
        event = "BufRead",
    },
    { -- colour highlighter
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    { -- colourscheme creation aid
        "rktjmp/lush.nvim",
    },
    { -- preview goto calls
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120; -- Width of the floating window
                height = 25; -- Height of the floating window
                default_mappings = false; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
                -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
                -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
            }
        end
    },
    { -- signature hints
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require"lsp_signature".on_attach() end,
    },
    { -- symbols outline
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },
    { -- diagnostics window
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    { -- preview markdown
        "npxbr/glow.nvim",
        ft = {"markdown"}
    },
    { -- smooth scrolling
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,        -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,              -- Function to run after the scrolling animation ends
            })
        end
    },
    { -- simple session persistence
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        -- module = "persistence",
        lazy = true,
        config = function()
            require("persistence").setup {
                dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
            }
        end,
    },
    { --highlight todos
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },
    { --underlines the word under the cursor
        "itchyny/vim-cursorword",
        event = {"BufEnter", "BufNewFile"},
        config = function()
            vim.api.nvim_command("augroup user_plugin_cursorword")
            vim.api.nvim_command("autocmd!")
            vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
            vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
            vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
            vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
            vim.api.nvim_command("augroup END")
        end
    },
    { -- try and enable '.' repeat support
        "tpope/vim-repeat"
    },
    { -- vim surround
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },
    { -- colourscheme
        "rafamadriz/neon",
        config = function()
            vim.g.neon_style = "dark"
            -- vim.cmd[[colorscheme neon]]
        end
    },
    { -- another one
        "nyngwang/nvimgelion"
    },
    { -- another one
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                color_overrides = {
                    mocha = {
                        -- base = "#000000",
                        -- mantle = "#000000",
                        -- crust = "#000000",
                    },
                },
            })
        end,
    },
    {
        "danymat/neogen",
        config = true,
        event = {"BufEnter", "BufNewFile"},
    }
}


-- treesitter integration for matchup
lvim.builtin.treesitter.matchup.enable = true
-- gay parentheses
lvim.builtin.treesitter.rainbow.enable = true

-- telescope extensions
lvim.builtin.telescope.on_config_done = function(telescope)
    pcall(telescope.load_extension, "fzy_native")
end
