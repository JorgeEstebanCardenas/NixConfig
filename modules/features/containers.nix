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

      oci-containers.containers.omniroute = {
        image = "docker.io/diegosouzapw/omniroute:latest";
        ports = [ "127.0.0.1:20128:20128" ];
        volumes = [ "/var/lib/omniroute:/app/data" ];
        environmentFiles = [ "/etc/omniroute.env" ];
        extraOptions = [ "--stop-timeout=40" ];
        autoStart = true;
      };
    };

    systemd.tmpfiles.rules = [
      "d /var/lib/omniroute 0750 root root - -"
    ];
  };
}
