return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    -- { import = "nvchad.blink.lazyspec" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc",
                "html", "css", "c", "cpp",
                "rust", "python", "kdl",
                "markdown", "wgsl"
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust_analyzer",
                "wgsl_analyzer",
                "clangd"
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = function(_, conf)
            conf.defaults.mappings.i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<Esc>"] = require("telescope.actions").close,
            }
            return conf
        end,
    }
}

