-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(opt)
    local fname = vim.api.nvim_buf_get_name(opt.buf)
    if #fname <= 0 then
      return
    end
    local size = vim.fn.getfsize(fname) / 1024
    if size >= 100 then
      vim.schedule(function()
        vim.lsp.buf_detach_client(opt.buf, opt.data.client_id)
      end)
    end
  end,
})
vim.g.autoformat = false
vim.g.neovide_fullscreen = true

-- vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", "<C-R>+") -- Paste insert mode
vim.keymap.set("n", "<D-z>", "u") -- Paste normal mode
vim.keymap.set("v", "<D-z>", "u") -- Paste visual mode
