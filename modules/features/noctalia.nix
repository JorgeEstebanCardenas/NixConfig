{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
      settings = builtins.fromJSON (builtins.readFile ../../assets/config/noctalia/noctalia-config.json);

      outOfStoreConfig = "/home/jorgec/.config/noctalia/";

    };
  };
}
