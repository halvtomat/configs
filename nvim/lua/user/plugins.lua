local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protceted call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
  open_fn = function()
    return require("packer.util").float { border = "rounded" }
  end,
  },
}

-- Install plugins here
return packer.startup(function(use)

  -- Overhead
  use "wbthomason/packer.nvim" -- Packer update
  use "nvim-lua/popup.nvim" -- Popup API from vim, required by many plugins
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by many plugins

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes
  use "patstockwell/vim-monokai-tasty" -- Monokai colorscheme

  -- Navigation
  use "mhinz/vim-startify"
  use "scrooloose/nerdtree"

  -- Completion
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    event = "InsertEnter",
    opt = true,
    config = function()
      require("user.coq").setup()
    end,
    run = ":COQdeps",
    requires = {
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" }
    },
  } -- Fast as fuck completion engine
  use {
    "windwp/nvim-autopairs", -- Autocomplete parenthesis and moosewings
    config = function() require("nvim-autopairs").setup({}) end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    wants = { "nvim-lsp-installer", "lsp_signature.nvim", "coq_nvim" },
    config = function()
      require("user.lsp").setup()
    end,
    requires = {
      "williamboman/nvim-lsp-installer",
      "ray-x/lsp_signature.nvim",
    },
  } -- Neovim official language server protocol

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

