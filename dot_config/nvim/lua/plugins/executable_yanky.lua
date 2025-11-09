return {
	'gbprod/yanky.nvim',
	dependencies = { 'folke/snacks.nvim' },
	opts = {},
	keys = {
		{
			'<leader>p',
			function()
				require('snacks').picker.yanky()
			end,
			mode = { 'n', 'x' },
			desc = 'Open Yank History',
		},
	},
}
