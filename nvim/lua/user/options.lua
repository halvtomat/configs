local options = {
  clipboard = "unnamedplus",
  ignorecase = true,
  mouse = "a",
  number = true,
  hlsearch = true,
  incsearch = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  showtabline = 2,
  expandtab = true,
  autoindent = true,
  splitbelow = true,
  splitright = true,
  updatetime = 300,
  showmatch = true,
}

for k,v in pairs(options) do
	vim.opt[k] = v
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    if ft == "python" then
      require("spacing/four")
    end
  end
})

