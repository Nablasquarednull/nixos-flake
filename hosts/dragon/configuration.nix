# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dragon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # Configure console keymap
  console.keyMap = "en";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.drew = {
    isNormalUser = true;
    description = "Dragon";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #Allow usbmuxd running as system service, might have to reboot it for it to work properly 
  services.usbmuxd.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    wget
    neovim
    curl
    git
    kitty
    firefox
    waybar
    mpv
    git-credential-oauth
    util-linux
    exfatprogs
    ntfs3g
    zip
    lshw
    mesa-demos
    egl-wayland
    libimobiledevice
    ifuse
    gvfs
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  #---------------------------------------------------------------
  nix.settings = {
  	experimental-features = ["nix-command" "flakes"];
	};
  programs.zsh.enable = true;
 # services.xserver.enable = true;
  services.xserver = {
    enable = true;

    videoDrivers = [ "modesetting"];

    # Opcional: útil si quieres poder usar X11 apps como fallback
    displayManager.gdm.wayland = true;
  };

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
      open = false; # Usa el driver propietario (recomendado para Ampere)
      nvidiaSettings = true; # Instala el panel nvidia-settings
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      prime = {
        offload.enable = true;
        offload.enableOffloadCmd = true;
  intelBusId = "PCI:0:2:0";
  nvidiaBusId = "PCI:1:0:0";     
      };
    };
  };

  # Importante para Wayland + Hyprland
  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";   # Previene el bug del cursor invisible
   # GBM_BACKEND = "nvidia-drm";      # Habilita render directo con NVIDIA GBM
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
  boot.extraModprobeConfig = ''
    options nvidia-drm modeset=1
  '';
  programs.hyprland = {
  	enable = true;
	xwayland.enable = true;
	};
 services.dbus.enable = true;
 security.polkit.enable = true;
 xdg.portal = {
 	enable = true;
	extraPortals = [pkgs.xdg-desktop-portal-gtk];
	};
services.pulseaudio.enable = false;
services.pipewire = {
enable = true;
audio.enable = true;
pulse.enable = true;
};
  #---------------------------------------------------------------

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
