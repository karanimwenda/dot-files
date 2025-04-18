return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("flutter-tools").setup({})
		end,
	},

	{
		"wa11breaker/flutter-bloc.nvim",
		dependencies = {
			"nvimtools/none-ls.nvim", -- Required for code actions
		},
		opts = {
			bloc_type = "equatable", -- Choose from: 'default', 'equatable', 'freezed'
			use_sealed_classes = false,
			enable_code_actions = true,
		},
	},
}
