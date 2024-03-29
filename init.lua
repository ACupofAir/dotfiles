--              astronvim configuration table
-- all configuration changes should go inside of the table below

-- you can think of a lua "table" as a dictionary like data structure the
-- normal format is "key = value". these also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

	-- configure astronvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "stable", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (stable only)
		branch = "main", -- branch name (nightly only)
		commit = nil, -- commit hash (nightly only)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = false, -- automatically reload and sync packer after a successful update
		auto_quit = false, -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- github user/repo shortcut,
		--   ["remote3"] = "github_user", -- github user assume astronvim fork
		-- },
	},

	-- set colorscheme to use
	colorscheme = "default_theme",

	-- override highlight groups in any theme
	highlights = {
		-- init = { -- this table overrides highlights in all themes
		--   Normal = { bg = "#000000" },
		-- }
		-- duskfox = { -- a table of overrides/changes to the duskfox theme
		--   Normal = { bg = "#000000" },
		-- },
	},

	-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	-- +++++++++++++++++++++++++++++++MyOption+++++++++++++++++++++++++++++++++++
	-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		o = {},
		opt = {
			relativenumber = true, -- sets vim.opt.relativenumber
			guifont = { "Maple Mono NF:h18, agave NF r:h18" },
			autochdir = false,
			spell = true,
			spelllang = { "en_us" },
			fileformat = "unix",
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
			autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
			cmp_enabled = true, -- enable completion at start
			autopairs_enabled = true, -- enable autopairs at start
			diagnostics_enabled = true, -- enable diagnostics at start
			status_diagnostics_enabled = true, -- enable diagnostics in statusline
			icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
			ui_notifications_enabled = true, -- disable notifications when toggling UI elements
			heirline_bufferline = false, -- enable new heirline based bufferline (requires :PackerSync after changing)
			mkdp_auto_close = 0,
			repl_filetype_commands = {
				python = "ipython --no-autoindent",
			},
			mdip_imgdir = "res",
			translator_default_engines = { "bing", "haici" },
		},
	},
	-- if you need more control, you can use the function()...end notation
	-- options = function(local_vim)
	--   local_vim.opt.relativenumber = true
	--   local_vim.g.mapleader = " "
	--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
	--   local_vim.opt.shortmess = vim.opt.shortmess + { i = true } -- add to option list
	--
	--   return local_vim
	-- end,

	-- set dashboard header
	header = {
		"          ▀████▀▄▄              ▄█ ",
		"            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ",
		"    ▄        █          ▀▀▀▀▄  ▄▀  ",
		"   ▄▀ ▀▄      ▀▄              ▀▄▀  ",
		"  ▄▀    █     █▀   ▄█▀▄      ▄█    ",
		"  ▀▄     ▀▄  █     ▀██▀     ██▄█   ",
		"   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ",
		"    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ",
		"   █   █  █      ▄▄           ▄▀   ",
		"    ███    ██ ██    ██ ██ ███    ███",
		"    ████   ██ ██    ██ ██ ████  ████",
		"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
		"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
		"    ██   ████   ████   ██ ██      ██",
	},

	-- default theme configuration
	default_theme = {
		-- set the highlight style for diagnostic messages
		diagnostics_style = { italic = true },
		-- modify the color palette for the default theme
		colors = {
			fg = "#abb2bf",
			bg = "#1e222a",
		},
		highlights = function(hl) -- or a function that returns a new table of colors to set
			local C = require("default_theme.colors")

			hl.Normal = { fg = C.fg, bg = C.bg }

			-- New approach instead of diagnostic_style
			hl.DiagnosticError.italic = true
			hl.DiagnosticHint.italic = true
			hl.DiagnosticInfo.italic = true
			hl.DiagnosticWarn.italic = true

			return hl
		end,
		-- enable or disable highlighting for extra plugins
		plugins = {
			aerial = true,
			beacon = false,
			bufferline = true,
			cmp = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			treesitter = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- diagnostics configuration (for vim.diagnostics.config({...}))
	diagnostics = {
		virtual_text = true,
		underline = true,
	},

	-- extend lsp configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		formatting = {
			-- control auto formatting on save
			format_on_save = {
				enabled = true, -- enable or disable format on save globally
				allow_filetypes = { -- enable format on save for specified filetypes only
					-- "go",
				},
				ignore_filetypes = { -- disable format on save for specified filetypes
					-- "python",
				},
			},
			disabled = { -- disable formatting capabilities for the listed language servers
				-- "sumneko_lua",
			},
			timeout_ms = 1000, -- default format timeout
			-- filter = function(client) -- fully override the default formatting function
			--   return true
			-- end
		},
		-- easily add or disable built in mappings added during lsp attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global lsp on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the mason server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- add overrides for lsp server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
			-- example disabling formatting for a specific language server
			-- gopls = { -- override table for require("lspconfig").gopls.setup({...})
			--   on_attach = function(client, bufnr)
			--     client.resolved_capabilities.document_formatting = false
			--   end
			-- }
		},
	},

	-- mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
	--
	-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	-- ++++++++++++++++++++++MyMappings+++++++++++++++++++++++++++++
	-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	--
	mappings = {
		-- first key is the mode
		n = {
			-- second key is the lefthand side of the map
			-- mappings seen under group name "buffer"
			["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "new tab" },
			["<leader>bc"] = { "<cmd>bufferlinepickclose<cr>", desc = "pick to close" },
			["<leader>bj"] = { "<cmd>bufferlinepick<cr>", desc = "pick to jump" },
			["<leader>bt"] = { "<cmd>bufferlinesortbytabs<cr>", desc = "sort by tabs" },
			["<leader>bn"] = { "<cmd>bn<cr>", desc = "next buffer" },
			["<leader>bo"] = { "<cmd>w | %bd | e#<CR>", desc = "Colse all buffers only keep current one" },
			["<leader>bp"] = { "<cmd>bp<cr>", desc = "previous buffer" },
			["<leader>rt"] = { "<cmd>ReplToggle<cr>", desc = "Toggle nvim-repl" },
			["<leader>rr"] = { "<cmd>ReplSend<cr>", desc = "nvim-repl send current line" },
			["<leader>rc"] = { "<cmd>ReplRunCell<cr>", desc = "nvim-repl run cell" },
			["<leader>fd"] = { "<cmd>cd %:p:h<cr>", desc = "Go to the current file directory" },
			["<leader>fe"] = { "<cmd>!explorer .<cr>", desc = "Use explorer to open the current folder" },
			["<leader>fp"] = { "<cmd>call mdip#MarkdownClipboardImage()<CR>", desc = "Paste image from clipboard" },
			["<leader>fw"] = {
				function()
					require("telescope.builtin").live_grep({ grep_open_files = true })
				end,
				desc = "Search words in open files",
			},
			["<Leader>tr"] = { "<Plug>TranslateW", desc = "Display translation in a window" },
			["<F11>"] = { "<cmd>let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", desc = "Toggle Full Screen" },
		},
		-- Comment

		-- quick save
		-- ["<c-s>"] = { ":w!<cr>", desc = "save file" },  -- change description but the same command
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
	},
	v = {
		["<Leader>tr"] = { "<Plug>TranslateWV", desc = "Display translation in a window" },
	},

	-- configure plugins
	--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	--++++++++++++++++++++++++++++++MyPlugins++++++++++++++++++++++++++++++++++++
	--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	plugins = {
		init = {
			-- you can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },
			-- you can also add new plugins here as well:
			-- add plugins, the packer syntax without the "use"
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "bufread",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			-- we also support a key value style plugin definition similar to nvchad:
			-- ["ray-x/lsp_signature.nvim"] = {
			--   event = "bufread",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			{ "tpope/vim-surround" },
			{ "tpope/vim-repeat" },
			{ "ACupofAir/nvim-repl", ft = "python" },
			{ "md-img-paste-devs/md-img-paste.vim", ft = "markdown" },
			{ "voldikss/vim-translator" },
		},
		cmp = {
			sources = {},
		},
		-- All other entries override the require("<key>").setup({...}) call for default plugins
		["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
			-- config variable is the default configuration table for the setup function call
			-- local null_ls = require "null-ls"

			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.prettier,
			}
			return config -- return final config table
		end,
		treesitter = { -- overrides `require("treesitter").setup(...)`
			-- ensure_installed = { "lua", "c", "cpp", "python" },
			auto_install = true,
			-- highlight = {
			--     enable = false,
			-- },
			-- rainbow = {
			--     enable = false,
			-- },
			-- autopairs = {
			--     enable = false
			-- },
			-- context_commentstring = {
			--     enable = false,
			--     enable_autocmd = false,
			-- },
			-- incremental_selection = {
			--     enable = false,
			-- },
			-- indent = {
			--     enable = false,
			-- },
		},
		-- use mason-lspconfig to configure lsp installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			-- ensure_installed = { "sumneko_lua" },
		},
		-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
		["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
			-- ensure_installed = { "prettier", "stylua" },
		},
		["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
			-- ensure_installed = { "python" },
		},
	},

	-- luasnip options
	luasnip = {
		-- add paths for including more vs code style snippets in luasnip
		vscode_snippet_paths = { "C:\\Users\\air\\AppData\\Roaming\\Code\\User\\snippets" },
		-- extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- cmp source priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- the value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- modify which-key registration (use this with mappings table in the above.)
	["which-key"] = {
		-- add bindings which show up as group name
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- third key is the key to bring up next level and its displayed
					-- group name in which-key top level menu
					["b"] = { name = "buffer" },
				},
			},
		},
	},

	-- ["lua-dev"] = {
	-- 	library = {
	-- 		enable = true,
	-- 		runtime = true,
	-- 		types = true,
	-- 		plugins = true,
	-- 	},
	-- 	override = function(rood_dir, options) end,
	-- },

	-- this function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		vim.opt.complete:append("kspell")
	end,
	-- all other entries override the require("<key>").setup({...}) call for default plugins
}
return config
