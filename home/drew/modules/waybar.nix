{ config, pkgs, lib, ... } @ args:

let
  theme = args.theme or {
    background = "#1e1e2e";
    foreground = "#cdd6f4";
    black      = "#313244";
    white      = "#ffffff";
    blue       = "#89b4fa";
    green      = "#a6e3a1";
    cyan       = "#94e2d5";
    magenta    = "#f5c2e7";
    yellow     = "#f9e2af";
  };
in
{
  programs.waybar = {
    enable = true;

    # Resto de tu configuración idéntica…
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 8;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = ["backlight" "pulseaudio" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate {id}";
          all-outputs = true;
        };

        backlight = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩖"];
          };

        clock = {
          format = "{:%A, %d %B %Y | %H:%M}";
        };

        pulseaudio = {
          format = " {volume}%";
          format-muted = " Muted";
          on-click = "pavucontrol";
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  {ifname}";
          format-disconnected = "⚠️ No Network";
          on-click = "networkmanager_dmenu";
        };

        battery = {
          format = "{capacity}% {icon}";
          format-icons = [ "" "" "" "" "" ];
          full-at = 99;
        };

        tray = {};
      };
    };

    style = ''
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 13px;
      }

      window#waybar {
        background: ${theme.background};
        color: ${theme.foreground};
      }

      #clock,
      #battery,
      #network,
      #pulseaudio,
      #tray,
      #workspaces {
        padding: 0 10px;
      }

      #workspaces button {
        border: none;
        background: ${theme.black};
        color: ${theme.white};
        padding: 0 8px;
        margin: 2px;
        border-radius: 6px;
      }

      #workspaces button.active {
        background: ${theme.blue};
        color: ${theme.background};
      }

      #battery {
        color: ${theme.green};
      }

      #network {
        color: ${theme.cyan};
      }

      #pulseaudio {
        color: ${theme.magenta};
      }

      #clock {
        color: ${theme.yellow};
      }
    '';
  };
}

