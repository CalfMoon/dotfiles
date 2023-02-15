local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("i","jk","<ESC>")
map("n","<C-t>",":NERDTreeToggle<CR>")
map("n","<C-y>",":NERDTreeClose<CR>")
map("n","<C-s>",":w<CR>")
