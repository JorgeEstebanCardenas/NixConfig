{ self, inputs, ... }: {

  flake.nixosModules.noctalia = { pkgs, lib, ... }: {
    programs.noctalia = {
      enable = true;

      recommendedServices.enable = true;
    };
  };

  #perSystem = { pkgs, ... }: {
  #  packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
  #    inherit pkgs;
  #    settings =
  #      (builtins.fromJSON (builtins.readFile ../../assets/config/noctalia/noctalia-config.json)).settings;

  #    outOfStoreConfig = "/home/jorgec/.config/noctalia/";

  #  };
  #};
}
