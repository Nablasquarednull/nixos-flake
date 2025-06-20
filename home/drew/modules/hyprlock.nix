{ pkgs, lib, ... }:

let
  lockShortcut = "SUPER, X, exec, hyprlock";
in
{
  # Hyprlock como paquete e integración con Hyprland
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        grace = 2; # tiempo antes del lock real
        hide-cursor = true;
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = "screenshot"; # borroso del fondo actual
          blur_passes = 2;
          blur_size = 5;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = {
            width = 200;
            height = 30;
          };
          outline_thickness = 3;
          dots_center = true;
          fade_on_empty = true;
          placeholder_text = "Enter password…";
          position = {
            x = 0;
            y = -200;
          };
          halign = "center";
          valign = "bottom";
          font_color = "rgba(ffffffee)";
          inner_color = "rgba(222222aa)";
          outer_color = "rgba(88888888)";
          outline_color = "rgba(ffffff88)";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''$TIME'';
          position = {
            x = 0;
            y = 580;
          };
          halign = "right";
          valign = "top";
          font_size = 32;
          font_color = "rgba(ffffffdd)";
        }
        {
          monitor = "";
          text = "Create.";
          position = {
            x = 0;
            y = 0;
          };
          halign = "left";
          valign = "top";
          font_size = 16;
          font_color = "rgba(aaaaaaff)";
        }
      ];
    };
  };

  # Keybind para lanzarlo
  wayland.windowManager.hyprland.settings = {
    bind = [
      lockShortcut
    ];
  };

  # Asegura que hyprlock esté disponible
  home.packages = with pkgs; [ hyprlock ];
}

