{ self, inputs, ... }: {
  flake.nixosModules.nvidia = { pkgs, lib, ... }: {

    services.xserver.videoDrivers = [
      "nvidia"
      "modesetting"
    ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia.open = false;

    hardware.nvidia.modesetting.enable = true;

    hardware.nvidia.powerManagement.enable = true;

    hardware.nvidia.nvidiaSettings = true;

    hardware.nvidia.prime = {

      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      #sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

    };
  };
}
