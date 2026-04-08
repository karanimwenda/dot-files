return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim" },

	-- Configure LazyVim to load gruvbox
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox",
		},
	},

	{
		"snacks.nvim",
		opts = {
			picker = {
				enabled = true,
				sources = {
					files = {
						hidden = true,
					},
					explorer = {
						autoclose = true,
						jump = { close = true }, -- jump close true ensures closing on file open
						hidden = true,
						ignored = true,
					},
				},
			},
		},
	},

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"elixir",
				"heex",
				"php",
				"blade",
				"css",
				"vue",
			},
		},
	},

	{ "wakatime/vim-wakatime", lazy = false },

	{
		"folke/noice.nvim",
		opts = {
			--
		},
	},
}
