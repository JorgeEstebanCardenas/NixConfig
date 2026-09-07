{ self, inputs, ... }: {
  flake.nixosModules.development = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      uv
      godotPackages_4_7.godot
    ];
  };
}
