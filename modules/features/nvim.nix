{ self, inputs, ... }: {
  flake.nixosModules.nvf = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim
    ];
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNvim =
        (inputs.nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            {
              vim.theme = {
                enable = true;
                name = "tokyonight";
                style = "night";
              };

              vim.globals.mapleader = " ";

              vim.options = {
                tabstop = 2;
                shiftwidth = 2;
                softtabstop = 2;
                expandtab = true;
              };

              vim.viAlias = true;
              vim.vimAlias = true;

              vim.lsp = {
                enable = true;
                formatOnSave = true;
              };

              vim.languages = {
                nix.enable = true;
                python.enable = true;
                lua.enable = true;

                css.enable = true;
                html.enable = true;
                json.enable = true;
                markdown.enable = true;
                typescript.enable = true;
                dart.enable = true;
              };

              vim.git = {
                gitsigns.enable = true;
                git-conflict.enable = true;
                hunk-nvim.enable = true;
                neogit.enable = true;
                octo-nvim.enable = true;
              };

              vim.autocomplete.blink-cmp.enable = true;
              vim.statusline.lualine.enable = true;
              vim.telescope.enable = true;
              vim.treesitter.enable = true;
              vim.filetree.nvimTree.enable = true;

              vim.keymaps = [
                {
                  key = "<leader>ff";
                  mode = "n";
                  action = ":Telescope find_files";
                }
                {
                  key = "<leader>f";
                  mode = "n";
                  action = ":Telescope";
                }
                {
                  key = "<leader>tt";
                  mode = "n";
                  action = ":NvimTreeToggle";
                }
                {
                  key = "<leader>t";
                  mode = "n";
                  action = ":NvimTreeFocus";
                }
                {
                  key = "<leader>gg";
                  mode = "n";
                  action = ":Neogit";
                }
                {
                  key = "<leader>te";
                  mode = "n";
                  action = ":term";
                }
                {
                  key = "<Esc>";
                  mode = "t";
                  action = "<C-\\><C-n>";
                }
                {
                  key = "<leader><tab>n";
                  mode = "n";
                  action = ":tabnew";
                }
              ];
            }
          ];
        }).neovim;
    };
}
