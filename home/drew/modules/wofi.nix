{ config, pkgs, ... }:

let
  tokyoNight = {
    background = "#1a1b26";
    foreground = "#c0caf5";
    accent     = "#7aa2f7";
    selection  = "#33467c";
  };
in {
  home.packages = [ pkgs.wofi ];

  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: JetBrainsMono Nerd Font, sans-serif;
      font-size: 14px;
    }

    window {
      margin: 5px;
      padding: 10px;
      background-color: ${tokyoNight.background};
      border: 2px solid ${tokyoNight.accent};
    }

    #input {
      margin: 5px;
      border-radius: 5px;
      padding: 6px;
      background-color: #16161e;
      color: ${tokyoNight.foreground};
    }

    #inner-box {
      margin: 5px;
      padding: 10px;
    }

    #outer-box {
      margin: 5px;
      padding: 5px;
    }

    #scroll {
      margin: 0px;
      padding: 5px;
    }

    #entry {
      padding: 8px;
      margin: 4px 0;
      border-radius: 4px;
      color: ${tokyoNight.foreground};
    }

    #entry:selected {
      background-color: ${tokyoNight.selection};
      color: ${tokyoNight.accent};
    }
  '';
}

