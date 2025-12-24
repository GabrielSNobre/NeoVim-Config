local o = vim.opt
local g = vim.g


-- Colorscheme
-- Definições Principais

o.showmode = false
o.number = true
o.relativenumber = true
--o.winbar = "%t %M"
o.shiftwidth = 4
o.tabstop = 4
o.wrap = false
o.laststatus = 2
o.ignorecase = true
o.smartcase = true
o.smartindent = true
o.expandtab = true
o.showtabline = 1
o.winborder = "rounded"
o.termguicolors = true
o.clipboard = "unnamedplus"

-- Definições Globais

g.mapleader = " "
g.maplocalleader = " "


_G.simple_tabline = function()
    local line = ''
    local current = vim.api.nvim_get_current_buf()
    
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_option(buf, 'buflisted') then
            local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ':t')
            name = name == '' and '[No Name]' or name
            
            -- Ícones simples baseados em extensão (sem dependência externa)
            local icon = ''
            if name:match('%.lua$') then icon = ' ' end
            if name:match('%.py$') then icon = ' ' end
            if name:match('%.js$') or name:match('%.ts$') then icon = ' ' end
            if name:match('%.json$') then icon = ' ' end
            if name:match('%.md$') or name:match('%.txt$') then icon = ' ' end
            if name:match('%.vim$') or name == 'init.lua' then icon = ' ' end
            
            local mod = vim.api.nvim_buf_get_option(buf, 'modified') and ' [+]' or ''
            
            line = line .. (buf == current and '%#TabLineSel#' or '%#TabLine#')
            line = line .. string.format(' %s%s%s ', icon, name, mod)
        end
    end
    
    return line .. '%#TabLineFill#'
end

vim.opt.tabline = '%!v:lua.simple_tabline()'
