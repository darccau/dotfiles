{
  pkgs,
  ...
}:
let
  # plugins not packaged in nixpkgs, vendored from upstream
  accelerated-jk = pkgs.vimUtils.buildVimPlugin {
    name = "accelerated-jk";
    src = pkgs.fetchFromGitHub {
      owner = "rainbowhxch";
      repo = "accelerated-jk.nvim";
      rev = "8fb5dad4ccc1811766cebf16b544038aeeb7806f";
      sha256 = "03s8bw3as2d3agqvllaxicmlbp1pmabc4g2bwyh4whb50h4fm66f";
    };
  };

  sortjson = pkgs.vimUtils.buildVimPlugin {
    name = "sortjson";
    src = pkgs.fetchFromGitHub {
      owner = "2nthony";
      repo = "sortjson.nvim";
      rev = "341e371e8c2b1f44b2129ad08da5efd6d7007c9f";
      sha256 = "1ak518yprc3zmd5kig2caw386lvgvc0dzl7fkfnm0nvqwasfamhy";
    };
  };
in
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;

    globals.mapleader = ";";

    # mirrors lua/config/options.lua
    opts = {
      confirm = false;
      laststatus = 0;
      backup = false;
      backupskip = [
        "/tmp/*"
        "/private/tmp/*"
      ];
      breakindent = true;
      foldmethod = "expr";
      formatoptions = "jcroqlnt";
      mouse = "";
      relativenumber = false;
      diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience";
      splitkeep = "cursor";
      textwidth = 80;
      splitbelow = true;
      splitright = true;
      virtualedit = "all";
      spelllang = "en";
      wrap = false;
    };

    # mirrors lua/config/keymaps.lua
    keymaps = [
      {
        mode = "n";
        key = "<leader>q";
        action = ":q!<CR>";
      }
      {
        mode = "n";
        key = "<leader>w";
        action = ":up<CR>";
      }
      {
        mode = "n";
        key = "<leader>a";
        action = ":wa<CR>";
      }
      {
        mode = "n";
        key = "sh";
        action = "<C-w>h";
      }
      {
        mode = "n";
        key = "sj";
        action = "<C-w>j";
      }
      {
        mode = "n";
        key = "sk";
        action = "<C-w>k";
      }
      {
        mode = "n";
        key = "sl";
        action = "<C-w>l";
      }
      {
        mode = "n";
        key = "sp";
        action = "<C-w>s";
      }
      {
        mode = "n";
        key = "sv";
        action = "<C-w>v";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<Tab>";
        action = "%";
      }
      {
        mode = "n";
        key = "<space>e";
        action = "<cmd>Neotree toggle<cr>";
      }
      {
        mode = "n";
        key = "rp";
        action = ":%s/\\v";
      }
      {
        mode = "v";
        key = "r";
        action = ":s/\\%V";
      }
      {
        mode = "n";
        key = "zn";
        action.__raw = "require('ufo').openAllFolds()";
      }
      {
        mode = "n";
        key = "zm";
        action.__raw = "require('ufo').closeAllFolds()";
      }
      {
        mode = "n";
        key = "cx";
        action = ":!chmod u+x %<CR>";
      }
      {
        mode = "n";
        key = "J";
        action = "mzJ`z";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
      }
      {
        mode = "i";
        key = ",";
        action = ",<C-g>u";
      }
      {
        mode = "i";
        key = ".";
        action = ".<C-g>u";
      }
      {
        mode = "i";
        key = ";";
        action = ";<C-g>u";
      }
      {
        mode = [
          "n"
          "x"
          "o"
        ];
        key = "e";
        action = "g_";
      }
      {
        mode = "n";
        key = "<leader>n";
        action = "<cmd>nohlsearch<cr>";
      }
      # code review
      {
        mode = "n";
        key = "sd";
        action = "<cmd>lua vim.lsp.buf.definition()<cr>";
      }
      {
        mode = "n";
        key = "sr";
        action = "<cmd>lua vim.lsp.buf.references()<cr>";
      }
      {
        mode = "n";
        key = "si";
        action = "<cmd>lua vim.lsp.buf.implementation()<cr>";
      }
      # fuzzy
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        mode = "n";
        key = "<leader>g";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        mode = "n";
        key = "<leader>m";
        action = "<cmd>Telescope lsp_references<cr>";
      }
      {
        mode = "n";
        key = "<leader>d";
        action = "<cmd>Telescope lsp_definitions<cr>";
      }
      # zen mode
      {
        mode = "n";
        key = "<leader>z";
        action = "<cmd>ZenMode<cr>";
      }
      # accelerated-jk
      {
        mode = "n";
        key = "j";
        action = "<Plug>(accelerated_jk_gj)";
      }
      {
        mode = "n";
        key = "k";
        action = "<Plug>(accelerated_jk_gk)";
      }
    ];

    # mirrors lua/config/autocmds.lua
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [
          "json"
          "jsonc"
          "markdown"
        ];
        callback = {
          __raw = "function() vim.wo.conceallevel = 0 end";
        };
      }
    ];

    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
        transparent = true;
        lualine_bold = true;
        terminal_colors = true;
      };
    };

    plugins = {
      treesitter = {
        enable = true;
        settings = {
          ensure_installed = [
            "astro"
            "css"
          ];
        };
      };

      telescope.enable = true;

      neo-tree = {
        enable = true;
        settings = {
          window = {
            position = "right";
          };
        };
      };

      bufferline = {
        enable = true;
        settings = {
          options = {
            mode = "tabs";
            show_buffer_close_icons = false;
            show_close_icon = false;
            separator_style = [
              ""
              ""
            ];
            sort_by = "insert_after_current";
          };
        };
      };

      nvim-ufo.enable = true;

      zen-mode = {
        enable = true;
        settings = {
          window = {
            width = 0.8;
            options.number = false;
          };
          plugins = {
            gitsigns = {
              enabled = true;
            };
          };
        };
      };

      twilight = {
        enable = true;
        settings = {
          dimming = {
            alpha = 0.25;
            color = [
              "Normal"
              "#ffffff"
            ];
            term_bg = "#000000";
            inactive = false;
          };
          context = 10;
          treesitter = true;
          expand = [
            "function"
            "method"
            "table"
            "if_statement"
          ];
          exclude = [ ];
        };
      };

      mini-surround = {
        enable = true;
        settings = {
          mappings = {
            add = "sa";
            delete = "sd";
            find = "sf";
            find_left = "sF";
            highlight = "sh";
            replace = "sr";
            update_n_lines = "sn";
          };
        };
      };

      gitsigns.enable = true;

      colorizer = {
        enable = true;
        settings = {
          filetypes = [
            "lua"
            "html"
            "vue"
            "javascript"
            "typescript"
            "javascriptreact"
            "typescriptreact"
            "css"
          ];
          RRGGBBAA = true;
          tailwind = true;
        };
      };

      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "super-tab";
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          lua_ls = {
            package = pkgs.lua-language-server;
          };
          pyright = {
            package = pkgs.pyright;
          };
          gopls = {
            package = pkgs.gopls;
          };
          ts_ls = {
            package = pkgs.typescript-language-server;
          };
          tailwindcss = {
            package = pkgs.tailwindcss-language-server;
          };
          terraformls = {
            package = pkgs.terraform-ls;
          };
          yamlls = {
            package = pkgs.yaml-language-server;
          };
          jsonls = {
            package = pkgs.vscode-langservers-extracted;
          };
          bashls = {
            package = pkgs.bash-language-server;
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            json = [ "prettier" ];
            jsonc = [ "prettier" ];
            yaml = [ "prettier" ];
            markdown = [ "prettier" ];
            css = [ "prettier" ];
            html = [ "prettier" ];
          };
          format_on_save = {
            lsp_format = "fallback";
            timeout_ms = 500;
          };
        };
      };
    };

    extraPlugins = [
      pkgs.vimPlugins.nvim-web-devicons
      accelerated-jk
      sortjson
      pkgs.vimPlugins."obsidian-nvim"
      pkgs.vimPlugins."incline-nvim"
    ];

    extraConfigLua = ''
      -- tokyonight: telescope highlight overrides (mirrors lua/plugins/colorscheme.lua)
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        style = "night",
        transparent = true,
        lualine_bold = true,
        terminal_colors = true,
        on_highlights = function(hl, c)
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      })
      tokyonight.load()

      -- ufo folding (mirrors lua/plugins/editor.lua)
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- incline per-window statusline (mirrors lua/plugins/ui.lua)
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#303270", guifg = "#a9b1d6" },
            InclineNormalNC = { guibg = "none", guifg = "#a9b1d6" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true, only_win = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[*]" .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })

      -- accelerated-jk (mirrors lua/plugins/util.lua)
      require("accelerated-jk").setup({
        mode = "time_driven",
        enable_deceleration = false,
        acceleration_motions = {},
        acceleration_limit = 150,
        acceleration_table = { 7, 12, 17, 21, 24, 26, 28, 30 },
        deceleration_table = { { 150, 9999 } },
      })

      -- nvim-colorizer handled by the colorizer nixvim module

      -- obsidian (mirrors lua/plugins/editor.lua)
      require("obsidian").setup({
        ui = { enable = false },
        workspaces = {
          { name = "notes", path = "~/Documents/notes" },
        },
        daily_notes = {
          folder = "dailies",
          date_format = "%Y-%m-%d",
          default_tags = { "daily-notes" },
          template = nil,
        },
        templates = {
          folder = "templates",
          date_format = "%Y-%m-%d",
          time_format = "%H:%M",
          substitutions = {},
        },
      })
    '';
  };
}
