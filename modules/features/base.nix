{ self, inputs, ... }: {
  flake.nixosModules.base = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      btop
      spotify
      obsidian
      fzf
      lazygit
    ];

    programs.vesktop = {
      enable = true;

      vencord.settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        notifyAboutUpdates = true;
      };
    };
  };
}
