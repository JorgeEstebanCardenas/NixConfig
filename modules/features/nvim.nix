{ self, inputs, ... }: {
  flake.nixosModules.nvf = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myNvim
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.myNvim = (inputs.nvf.lib.neovimConfiguration {
      inherit pkgs;
      modules = [
        {
          vim.theme = {
	    enable = true;
	    name = "tokyonight";
	    style = "dark";
	  }
		
	  vim.viAlias = false;
          vim.vimAlias = true;

          vim.lsp = {
            enable = true;
            formatOnSave = true;
          };

	  vim.languages = {
	    nix.enable = true;
	    python.enable = true;
	    lua.enable = true;
	  }

          vim.statusline.lualine.enable = true;
          vim.telescope.enable = true;
	  vim.treesitter.enable = true;
	  vim.filetree.nvimTree.enable = true;

          vim.keymaps = [
            { key = "<leader>e"; mode = "n"; action = ":Ex<CR>"; }
          ];
        }
      ];
    }).neovim;
  };
}
