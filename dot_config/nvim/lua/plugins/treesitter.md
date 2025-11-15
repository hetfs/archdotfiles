return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			local config = require('nvim-treesitter.configs')
			config.setup({
				auto_install = true,
				ensure_installed = {
					'bash',
					'html',
					'css',
					'scss',
					'javascript',
					'typescript',
					'json',
					'lua',
					'yaml',
				},
				highlight = { enable = true },
				indent = { enable = false },
			})
		end,
	},
}
