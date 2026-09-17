{ self, inputs, ... }: {
  flake.nixosModules.containers = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      podman-compose
      podman-tui
    ];

    virtualisation = {
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };

      oci-containers = {
        backend = "podman";
      };
    };
  };
}
