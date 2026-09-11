{ self, inputs, ... }: {

  flake.nixosModules.myMachineConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        self.nixosModules.myMachineHardware
        self.nixosModules.niri
        self.nixosModules.nvf
        self.nixosModules.zen-browser
        self.nixosModules.kitty
        self.nixosModules.development
        self.nixosModules.base
        self.nixosModules.nvidia
        self.nixosModules.gaming
      ];
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Use the systemd-boot EFI boot loader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "nixos"; # Define your hostname.

      nix.optimise.automatic = true;

      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone.
      time.timeZone = "America/Hermosillo";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_US.UTF-8";

      # Enable the GNOME Desktop Environment.
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      services.gvfs.enable = true;
      services.udisks2.enable = true;

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "latam";
        variant = "";
      };

      # Configure console keymap
      console.keyMap = "la-latin1";

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # Use the WirePlumber session manager
        #wireplumber.enable = true;
      };

      # Enable touchpad support (enabled default in most desktopManager).
      # services.libinput.enable = true;

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users."jorgec" = {
        isNormalUser = true;
        description = "Jorge Cardenas";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      # Install firefox.
      programs.firefox.enable = true;

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = with pkgs; [
        vim
        wget
        git
      ];

      fonts.packages = with pkgs; [
        nerd-fonts.fira-code
      ];

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      system.stateVersion = "26.05"; # DO NOT TOUCH

    };

}
