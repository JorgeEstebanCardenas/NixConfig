{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.myNoctalia ];

    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;
        settings = {
          spawn-at-startup = [
            "noctalia"
          ];

          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          hotkey-overlay.skip-at-startup = _: { };

          input.keyboard.xkb.layout = "latam";

          input.touchpad = {
            tap = _: { };
            natural-scroll = _: { };
            tap-button-map = "left-right-middle";
          };

          layout.gaps = 5;

          binds = {
            "Mod+T".spawn-sh = "kitty";
            "Mod+Q".close-window = _: { };
            "Mod+S".spawn-sh = "noctalia msg panel-toggle launcher";
            "Mod+F".maximize-column = _: { };
            "Mod+Shift+F".fullscreen-window = _: { };
          };
        };
      };
    };
}
