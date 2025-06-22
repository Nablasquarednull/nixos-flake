{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        before_sleep_cmd = "hyprctl dispatch dpms off";
        lock_cmd = "hyprlock"; # o tu script de bloqueo si usas uno personalizado
      };

      listeners = [
        # Listener 1: Bloqueo tras 5 minutos de inactividad
        {
          timeout = 300; # segundos = 5 min
          on-timeout = "hyprlock";
        }

        # Listener 2: Suspensión tras 10 minutos de inactividad
        {
          timeout = 600; # segundos = 10 min
          on-timeout = "systemctl suspend";
          on-resume = ""; # puedes poner algún comando si quieres al volver
        }
      ];
    };
  };
}

