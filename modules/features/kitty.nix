{ self, inputs, ... }: {
  flake.nixosModules.kitty = { pkgs, lib, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty
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
      packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
        inherit pkgs;

        font = {
          name = "FiraCode Nerd Font";
          size = 12;
        };

        settings = {
          disable_ligatures = "never";

          shell = "${pkgs.zsh}/bin/zsh";

          enable_audio_bell = false;
          confirm_os_window_close = 0;
          background_opacity = "0.9";
        };
      };
    };
}
