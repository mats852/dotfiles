-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/mats/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/mats/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/mats/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/mats/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/mats/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip.git"
  },
  ale = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale.git"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim.git"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer.git"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline.git"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp.git"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path.git"
  },
  ["ctrlsf.vim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/ctrlsf.vim",
    url = "https://github.com/dyng/ctrlsf.vim.git"
  },
  delimitmate = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/delimitmate",
    url = "https://github.com/raimondi/delimitmate.git"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim.git"
  },
  everforest = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest.git"
  },
  fzf = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf.git"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox.git"
  },
  harpoon = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon.git"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter.git"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin",
    url = "https://github.com/Xuyuanp/nerdtree-git-plugin.git"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp.git"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap.git"
  },
  ["nvim-dap-go"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go.git"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui.git"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig.git"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter.git"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim.git"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim.git"
  },
  sonokai = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai.git"
  },
  ["space-vim-dark"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/space-vim-dark",
    url = "https://github.com/liuchengxu/space-vim-dark.git"
  },
  ["tmuxline.vim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/tmuxline.vim",
    url = "https://github.com/edkolev/tmuxline.vim.git"
  },
  ["twig.vim"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/twig.vim",
    url = "https://github.com/nelsyeung/twig.vim.git"
  },
  vim = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim",
    url = "https://github.com/dracula/vim.git"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/bling/vim-airline.git"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes.git"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive.git"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter.git"
  },
  ["vim-php-cs-fixer"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-php-cs-fixer",
    url = "https://github.com/stephpy/vim-php-cs-fixer.git"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround.git"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/janko/vim-test.git"
  },
  vimux = {
    loaded = true,
    path = "/Users/mats/.local/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/preservim/vimux.git"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
