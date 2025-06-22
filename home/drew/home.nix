# home/drew/home.nix
{ config, pkgs, inputs, ... }:

let
  modulesPath = "${inputs.self}/home/drew/modules";
in
{
  imports = [
    "${modulesPath}/hypridle.nix"
    "${modulesPath}/hyprpaper.nix"
    "${modulesPath}/hyprlock.nix"
    "${modulesPath}/hyprland.nix"
    "${modulesPath}/waybar.nix"
    "${modulesPath}/kitty.nix"
    "${modulesPath}/wofi.nix"
    "${modulesPath}/oh-my-zsh.nix"
  ];

  home.username = "drew";
  home.homeDirectory = "/home/drew";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    waybar wofi kitty firefox zsh fastfetch btop zathura yt-dlp
    python3 clang git-credential-oauth anki-bin pamixer brightnessctl
    inetutils usbutils playerctl grim slurp wl-clipboard xdg-utils
    tree nnn ranger nerd-fonts.jetbrains-mono networkmanager_dmenu
    hyprpaper papirus-icon-theme jq hypridle
  ];

  home.stateVersion = "25.05";
}

