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
local package_path_str = "/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yxqsnz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  ["3bc.vim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/3bc.vim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-spell"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/cmp-tabnine"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/crates.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  everforest = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["fluent.vim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/fluent.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-clang-format"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-clang-format"
  },
  ["vim-clap"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-clap"
  },
  ["vim-qml"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-qml"
  },
  ["vim-toml"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-toml"
  },
  ["vim-two-firewatch"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-two-firewatch"
  },
  ["vim-vscode-theme"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-vscode-theme"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  vimpeccable = {
    loaded = true,
    path = "/home/yxqsnz/.local/share/nvim/site/pack/packer/start/vimpeccable"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
