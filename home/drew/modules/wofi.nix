{ config, pkgs, ... }:

let
  theme = {
    background = "#ffffff";
    foreground = "#000000";
    accent     = "#cccccc"; # borde y resaltado sutil
    selection  = "#e0e0e0"; # fondo para ítem seleccionado
  };
in {
  home.packages = [ pkgs.wofi ];

  # Configuración del estilo
  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: JetBrainsMono Nerd Font;
      font-weight: bold;
      font-size: 14px;
      color: ${theme.foreground};
    }

    window {
      background-color: ${theme.background};
      border: 2px solid ${theme.accent};
      border-radius: 12px;
      padding: 10px;
    }

    #input {
      background-color: ${theme.selection};
      padding: 8px;
      border-radius: 8px;
      margin-bottom: 10px;
      border: none;
    }

    #inner-box, #outer-box, #scroll {
      margin: 0;
      padding: 0;
    }

    #entry {
      padding: 10px;
      margin: 5px 0;
      border-radius: 8px;
      background-color: ${theme.background};
      color: ${theme.foreground};
    }

    #entry:selected {
      background-color: ${theme.selection};
      color: ${theme.foreground};
    }
  '';

  # Configuración general de wofi (opcional, pero útil)
  xdg.configFile."wofi/config".text = ''
    show-icons=true
    allow-markup=true
    insensitive=true
    no-persistent-history=true
    location=center
    width=500
    height=400
    lines=10
    prompt=Buscar:
  '';
}

