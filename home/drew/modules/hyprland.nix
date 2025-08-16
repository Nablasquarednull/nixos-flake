{ config, pkgs, lib, ... }:

let
  mod = "SUPER";
in {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      bind = [
        "${mod}, Return, exec, kitty"
        "SUPER SHIFT, Q, killactive,"
        "${mod}, D, exec, wofi --show drun"
        "SUPER, X, exec, hyprlock"

        "${mod} SHIFT, H, movewindow, l"
        "${mod} SHIFT, L, movewindow, r"
        "${mod} SHIFT, K, movewindow, u"
        "${mod} SHIFT, J, movewindow, d"

        "${mod}, H, movefocus, l"
        "${mod}, L, movefocus, r"
        "${mod}, K, movefocus, u"
        "${mod}, J, movefocus, d"

        "${mod}, F, fullscreen"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute, exec, pamixer -t"

        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ] ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = toString (i + 1);
          in [
            "${mod}, ${ws}, workspace, ${ws}"
            "${mod} SHIFT, ${ws}, movetoworkspace, ${ws}"
          ]
        ) 9)
      );
    };

    extraConfig = ''
      input {
        kb_layout = us
      }
      exec-once = waybar
      monitor = eDP-1,1920x1080@60,0x0,1
      windowrulev2 = opacity 0.95 0.7,class:^(kitty)$
      general {
    border_size = 3
    col.active_border = rgba(33ccffee)
    col.inactive_border = rgba(333333aa)
  }

  decoration {
    rounding = 10
  }
  exec-once = hyprpaper
  exec-once = hypridle
    '';
  };
}

