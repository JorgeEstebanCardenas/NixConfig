{ self, inputs, ... }: {
  flake.nixosModules.nvidia = { pkgs, lib, ... }: {

    services.xserver.videoDrivers = [
      "nvidia"
      "modesetting"
    ];

    hardware.graphics = {
      enable = true;
      enable32bit = true;
    };

    hardware.nvidia.prime = {

      offload.enable = true;
      #sync.enable = true;

      intelBusId = "PIC:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

    };
  };
}
