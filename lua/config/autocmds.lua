-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Kitty: drop the window padding while Neovim runs, restore it on exit/suspend.
-- Uses kitty remote control (allow_remote_control socket-only in kitty.conf).
if vim.env.KITTY_WINDOW_ID and vim.env.KITTY_LISTEN_ON then
  local function kitty_padding(value)
    vim.system({
      "kitty", "@", "--to", vim.env.KITTY_LISTEN_ON,
      "set-spacing", "--match", "id:" .. vim.env.KITTY_WINDOW_ID, "padding=" .. value,
    })
  end
  local group = vim.api.nvim_create_augroup("kitty_padding", { clear = true })
  -- this file loads on VeryLazy (after VimEnter), so apply right away
  kitty_padding(0)
  vim.api.nvim_create_autocmd("VimResume", { group = group, callback = function() kitty_padding(0) end })
  vim.api.nvim_create_autocmd({ "VimLeavePre", "VimSuspend" }, {
    group = group,
    callback = function()
      -- synchronous on exit so the command runs before nvim quits
      vim.system({
        "kitty", "@", "--to", vim.env.KITTY_LISTEN_ON,
        "set-spacing", "--match", "id:" .. vim.env.KITTY_WINDOW_ID, "padding=default",
      }):wait(500)
    end,
  })
end
