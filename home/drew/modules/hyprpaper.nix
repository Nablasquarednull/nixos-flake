{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/drew/Pictures/wallpaper.png" ];
      wallpaper = [ ",/home/drew/Pictures/wallpaper.png" ];
      splash = false;
    };
  };
}

