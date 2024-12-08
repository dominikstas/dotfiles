-- Install Packer plugins
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer manages itself

    -- Themes
    use 'gruvbox-community/gruvbox' -- Gruvbox theme
    use 'folke/tokyonight.nvim'    -- Tokyo Night theme
    use 'rebelot/kanagawa.nvim'


    -- Syntax highlighting and language support
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- File Explorer
    use 'nvim-tree/nvim-tree.lua'

    -- Other plugins here...
    require('nvim-tree').setup()

    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('nvim-tree').setup()



-- Theme Configuration
-- Default options:-- setup must be called before loading
vim.cmd("colorscheme kanagawa")

-- Basic Settings
vim.o.number = true -- Line numbers
vim.o.relativenumber = true -- Relative numbers
vim.o.clipboard = 'unnamedplus' -- System clipboard
vim.o.tabstop = 4 -- Tab size
vim.o.shiftwidth = 4 -- Indentation size
vim.o.expandtab = true -- Use spaces for tabs
vim.o.wrap = false -- Disable line wrapping

