{ config, pkgs, ... }:

let
  ewwConfigDir = ".config/eww";
in {
  home.packages = with pkgs; [ eww ];

  home.file."${ewwConfigDir}/main.yuck".text = ''
    (defwidget mybar []
      (box :orientation "h" :spacing 10 :class "bar"
        (label :text "🧠 Eww bar")
        (clock)))

    (window :name "bar" :monitor 0 :anchor "top center" :exclusive true
      (mybar))
  '';

  home.file."${ewwConfigDir}/style.scss".text = ''
    .bar {
      background-color: #111;
      color: #fff;
      font-size: 14px;
      padding: 5px 10px;
      font-family: "JetBrainsMono Nerd Font", monospace;
    }
  '';
}

