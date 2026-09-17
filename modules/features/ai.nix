{ self, inputs, ... }: {
  flake.nixosModules.ai = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      lmstudio
      #lmstudio-bionic
      pi-coding-agent
      nodejs_22
    ];

  };

}
