return { {
    "stevearc/conform.nvim",
     event = 'BufWritePre',
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
   {
     "neovim/nvim-lspconfig",
     config = function()
       require("nvchad.configs.lspconfig").defaults()
       require "configs.lspconfig"
     end,
   },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
  },
   {
   	"williamboman/mason.nvim",
   	opts = {
   		ensure_installed = {
   			"lua-language-server",
        "stylua",
        "gopls",
   			"html-lsp",
        "css-lsp" ,
        "prettier",
        "rust-analyzer",
        "pyright",
        "debugpy",
        "mypy",
        "astro-language-server",
        "svelte-language-server",
        "clangd",
        "deno",
        "phpcs",
        "php-cs-fixer",
        "nextls",
   		},
   	},
   },
   {
   	"nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim",
        "lua",
        "vimdoc",
        "go",
        "html",
        "css",
        "tsx",
        "c",
        "javascript",
        "typescript",
        "rust",
        "svelte",
        "cpp",
        "php",
        "elixir"
   		},
   	},
   },
{
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local elixir = require("elixir")
    local elixirls = require("elixir.elixirls")

    elixir.setup {
      nextls = {enable = true},
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = false,
          enableTestLenses = false,
        },
        filetypes = {"exs", "ex"},
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
          vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
        end,
      },
      projectionist = {
        enable = true
      }
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
},
    {
	"lukas-reineke/indent-blankline.nvim",
	  opts = function(_, opts)
		-- Other blankline configuration here
		      return require("indent-rainbowline").make_opts(opts)
	      end,
	  dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	  },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    opts = function ()
      return require "configs.rust-tools"
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
  "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {} -- your configuration
  },
 {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
}
