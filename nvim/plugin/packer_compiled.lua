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
local package_path_str = "/home/darccau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/darccau/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/darccau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/darccau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/darccau/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["goldsmith.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/goldsmith.nvim",
    url = "https://github.com/WhoIsSethDaniel/goldsmith.nvim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    config = { "\27LJ\2\nq\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\0A\0\0\1K\0\1\0\b%:p\vexpand\afn\bvim\19test_directory\25plenary.test_harness\frequire\\\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\15<leader>tp\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n×\1\0\0\f\0\b\0\0225\0\0\0004\1\3\0005\2\1\0>\0\4\2>\2\1\0015\2\2\0>\0\4\2>\2\2\0016\2\3\0\18\4\1\0B\2\2\4H\5\a€6\a\4\0009\a\5\a9\a\6\a6\t\a\0\18\v\6\0B\t\2\0A\a\0\1F\5\3\3R\5÷K\0\1\0\vunpack\bset\vkeymap\bvim\npairs\1\4\0\0\6n\15<leader>tt\22<Cmd>TestFile<CR>\1\4\0\0\6n\14<leader>t\25<Cmd>TestNearest<CR>\1\0\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/home/darccau/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: plenary.nvim
time([[Config for plenary.nvim]], true)
try_loadstring("\27LJ\2\nq\0\0\5\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0009\2\4\0029\2\5\2'\4\6\0B\2\2\0A\0\0\1K\0\1\0\b%:p\vexpand\afn\bvim\19test_directory\25plenary.test_harness\frequire\\\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\0\15<leader>tp\6n\bset\vkeymap\bvim\0", "config", "plenary.nvim")
time([[Config for plenary.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n×\1\0\0\f\0\b\0\0225\0\0\0004\1\3\0005\2\1\0>\0\4\2>\2\1\0015\2\2\0>\0\4\2>\2\2\0016\2\3\0\18\4\1\0B\2\2\4H\5\a€6\a\4\0009\a\5\a9\a\6\a6\t\a\0\18\v\6\0B\t\2\0A\a\0\1F\5\3\3R\5÷K\0\1\0\vunpack\bset\vkeymap\bvim\npairs\1\4\0\0\6n\15<leader>tt\22<Cmd>TestFile<CR>\1\4\0\0\6n\14<leader>t\25<Cmd>TestNearest<CR>\1\0\2\vsilent\2\fnoremap\2\0", "config", "vim-test")
time([[Config for vim-test]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
