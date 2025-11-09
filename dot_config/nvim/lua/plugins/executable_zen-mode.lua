return {
  "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        zindex = 10, -- Controls the z-index of the Zen window
        backdrop = 1,
        width = 120, -- Width of the Zen window
        height = 1, -- Height of the Zen window

        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
          -- you may turn on/off statusline in zen mode by setting 'laststatus'
          -- statusline will be shown only if 'laststatus' == 3
          laststatus = 0, -- turn off the statusline in zen mode
        },
        twilight = { enabled = true }, -- Enable Twilight when Zen mode opens
        gitsigns = { enabled = true }, -- Disable Git signs
        tmux = { enabled = false }, -- Disable tmux statusline
        todo = { enabled = false }, -- Disable todo-comments highlighting

        -- this will change the font size on kitty when in zen mode
        kitty = {
          enabled = false, -- Disable Kitty font size change
          font = "+2", -- Font size increment for Kitty
        },

        -- uses `alacritty msg` subcommand to change font size
        alacritty = {
          enabled = false, -- Enable Alacritty font size change
          font = "14", -- Font size for Alacritty
        },
        wezterm = {
          enabled = false, -- Enable WezTerm font size change
          font = "+4", -- (10% increase per step)
        },
      },
    },
    -- Optional keybinding for toggling Zen Mode
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" } },
  },
  --[[  Tips
  --https://github.com/folke/zen-mode.nvim
  --https://github.com/wez/wezterm/discussions/2550
  --In order to make the integration with wezterm work as intended,
  --you need to add the following function to your wezterm config:

  wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)
  --]]
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win) end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function() end,
}
