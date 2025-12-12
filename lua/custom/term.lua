local M = {}

-- table de terminais: cada um com buffer e janela independentes
local terms = {
  [1] = { buf = nil, win = nil, height = 12 },
  [2] = { buf = nil, win = nil, height = 12 },
}

-- abre um terminal específico
local function open_term(id)
  local term = terms[id]

  -- Se a janela existe, só focamos nela
  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_set_current_win(term.win)
    return
  end

  -- criar a janela primeiro!
  vim.cmd("botright " .. term.height .. "split")
  term.win = vim.api.nvim_get_current_win()

  -- criar o buffer apenas uma vez
  if not (term.buf and vim.api.nvim_buf_is_valid(term.buf)) then
    term.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_win_set_buf(term.win, term.buf)
    vim.fn.termopen(vim.o.shell)
  else
    -- reusar buffer existente
    vim.api.nvim_win_set_buf(term.win, term.buf)
  end

  -- ajustes
  vim.wo.number = false
  vim.wo.relativenumber = false
  vim.cmd("startinsert")
end

-- fecha um terminal específico
local function close_term(id)
  local term = terms[id]

  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_close(term.win, true)
  end

  term.win = nil
end

-- toggle
function M.toggle(id)
  id = id or 1

  local term = terms[id]

  if term.win and vim.api.nvim_win_is_valid(term.win) then
    close_term(id)
  else
    open_term(id)
  end
end

-- setup do plugin
function M.setup(opts)
  opts = opts or {}

  -- permitir configuração opcional de altura
  if opts.height then
    terms[1].height = opts.height
    terms[2].height = opts.height
  end

  -- keymaps default (opcionais)
  vim.keymap.set("n", "<leader>1", function() M.toggle(1) end,
    { desc = "Toggle Terminal 1" })

  vim.keymap.set("n", "<leader>2", function() M.toggle(2) end,
    { desc = "Toggle Terminal 2" })

  -- sair do terminal com esc
  vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
end

return M


