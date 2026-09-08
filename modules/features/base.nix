{ self, inputs, ... }: {
  flake.nixosModules.base = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      btop
      spotify
      obsidian
      fzf
      lazygit
    ];
  };
}
