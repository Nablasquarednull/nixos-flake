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

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        spacing = 8;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "custom/userhost" ];
        modules-right = [ "backlight" "pulseaudio" "network" "battery" "tray" "clock" ];

        "custom/userhost" = {
          format = "drew@dragon";
        };

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
        font-size: 15px;
        font-weight: bold;
      }

      window#waybar {
        background: transparent;
        color: black;
      }

      #custom-userhost,
      #clock,
      #battery,
      #network,
      #pulseaudio,
      #tray,
      #backlight {
        background: rgba(255, 255, 255, 0.8);
        color: black;
        padding: 2px 10px;
        margin: 4px 4px;
        border-radius: 8px;
      }

      #workspaces button {
        background: rgba(255, 255, 255, 0.8);
        color: black;
        border: none;
        padding: 2px 10px;
        margin: 4px 4px;
        border-radius: 8px;
      }

      #workspaces button.active {
        background: ${theme.blue};
        color: white;
      }
    '';
  };
}

