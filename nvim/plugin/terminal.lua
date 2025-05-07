local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}
local function create_float(opts)
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  local win_opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = math.floor((vim.o.lines - height) / 2),
    col = math.floor((vim.o.columns - width) / 2),
    border = opts.border or 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, win_opts)

  -- Optional: Set content
  if opts.lines then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, opts.lines)
  end

  -- Optional: Close with 'q'
  vim.keymap.set('n', 'q', function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf })

  return { win = win, buf = buf }
end

vim.api.nvim_create_user_command('FloatTerminal', function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_float { buf = state.floating.buf }
    if vim.bo[state.floating.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
    vim.api.nvim_command 'startinsert'
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, { desc = 'Toggle floating window with a terminal' })
vim.keymap.set('n', '<leader>t', vim.cmd.FloatTerminal)
