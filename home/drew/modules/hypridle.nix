{ pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listeners = [
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 660;
          on-timeout = "systemctl suspend";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}

