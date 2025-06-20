{ pkgs, lib, ... }:

let
  wallpaperPath = "/home/drew/Pictures/wallpaper.png";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ wallpaperPath ];
      wallpaper = [ "*,${wallpaperPath}" ];
      splash = false;
    };
  };

  home.packages = with pkgs; [ hyprpaper ];

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "sleep 0.5 && hyprpaper"
    ];
  };
}

