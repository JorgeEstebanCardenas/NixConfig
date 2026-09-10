{ self, inputs, ... }: {

  flake.nixosModules.gaming = { pkgs, lib, ... }: {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;

      steam = {
        enable = true;

        package = pkgs.steam.override {
          extraArgs = "-system-composer";
        };

        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;

        gamescopeSession.enable = true;

        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };

    };

  };

}
