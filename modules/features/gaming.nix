{ self, inputs, ... }: {

  flake.nixosModules.nvidia = { pkgs, lib, ... }: {
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;

      steam = {
        enable = true;

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
