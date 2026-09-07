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
          #font_family = "FiraCode Nerd Font";
          #bold_font = "FiraCode Nerd Font Bold";
          #italic_font = "FiraCode Nerd Font Italic";
          #bold_italic_font = "FiraCode Nerd Font Bold Italic";
          #font_size = 11;

          disable_ligatures = "never";

          enable_audio_bell = false;
          confirm_os_window_close = 0;
          background_opacity = "0.9";
        };
      };
    };
}
