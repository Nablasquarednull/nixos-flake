{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/drew/Pictures/Solitary.png" ];
      wallpaper = [ ",/home/drew/Pictures/Solitary.png" ];
      splash = false;
    };
  };
}

