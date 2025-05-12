vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.list = true -- show tab characters and trailing whitespace

vim.opt.relativenumber = true
vim.opt.number = true

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.js", "*.ts", "*.tsx", "*.html", "*.css", "*.lua", "*.dart", "*.yaml" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
}) -- javascript formatting

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
