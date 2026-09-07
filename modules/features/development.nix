{ self, inputs, ... }: {
  flake.nixosModules.development = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      uv
      godotPackages_4_7.godot
    ];

    programs.nix-ld.enable = true;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        edit = "sudo -e";
        rebuild = "sudo nixos-rebuild switch --flake .#myMachine";
      };

      histSize = 10000;
      histFile = "$HOME/.zsh_history";
      setOptions = [
        "HIST_IGNORE_ALL_DUPS"
      ];

      ohMyZsh = {
        enable = true;
        theme = "robbyrussell";

        plugins = [
          "git"
          "fzf"
          "uv"
        ];

      };

    };

    # Make zsh a valid login shell and available system-wide
    environment.shells = [ pkgs.zsh ];

    # Set it as your user's default shell
    users.users.jorgec.shell = pkgs.zsh;

  };
}
