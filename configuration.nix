{ config, pkgs, ... }:
{
  imports =
    [ ./hardware-configuration.nix ];

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev" ;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 2;

  networking.hostName = "duck";
  networking.networkmanager.enable = true;

  networking.firewall.extraCommands = ''
    iptables -A nixos-fw -p tcp --source 192.168.0.0/24 --dport 8080 -j nixos-fw-accept
    iptables -A nixos-fw -p udp --source 192.168.0.0/24 --dport 8080 -j nixos-fw-accept
  '';

  time.timeZone = "America/Sao_Paulo";

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
  };

  environment.systemPackages = with pkgs; [ home-manager vim ];

  virtualisation.docker.enable = true;

  system.copySystemConfiguration = true;

  system.stateVersion = "22.05";

  users.users.dewey = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "networkmanager" "docker" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  hardware.opengl.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  services.openssh.enable = true;

  services.xserver = {
    enable = true;

    autoRepeatDelay = 250;
    autoRepeatInterval = 20;
    layout = "us";
    xkbVariant = "intl";

    videoDrivers = [ "nvidia" ];
    displayManager.sddm.enable = true;
    windowManager.dwm.enable = true;
  };

}
