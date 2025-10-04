{ config, pkgs, ... }:

let
  theme = {
    white       = "rgba(255, 255, 255, 1)";
    background  = "rgba(100, 100, 100, 0.6)";
    foreground  = "rgba(255, 255, 255, 0.5)";
    accent      = "rgba(42, 42, 42, 0.5)";
    selection   = "rgba(46, 46, 46, 0.8)";
    gris_claro  = "rgba(58, 58, 58, 0.5)";
    };
in {
  home.packages = [ pkgs.wofi ];

  # Configuración del estilo
  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: JetBrainsMono Nerd Font;
      font-weight: bold;
      font-size: 14px;
      color: ${theme.white};
    }

    window {
      background-color: ${theme.background};
      border: 2px solid ${theme.accent};
      border-radius: 20px;
      padding: 10px;
    }

    #input {
      background-color: ${theme.selection};
      border-radius: 12px;
      margin-bottom: 16px;
      border: none;
      color: ${theme.white};
    }

    #inner-box, #outer-box, #scroll {
      margin: 0;
      padding: 0;
    }

    #entry {
      padding: 10px;
      margin: 5px;
      border-radius: 12px;
      background-color: transparent;
      color: ${theme.foreground};
      transition: background-color 0.2s ease;
    }

    #entry:selected {
      background-color: ${theme.gris_claro};
    }

    #img {
      min-width: 32px;
      min-height: 32px;
   }  

  '';

  # Configuración general de wofi (opcional, pero útil)
  xdg.configFile."wofi/config".text = ''
    show-icons=true
    allow_markup=true
    allow_images=true
    image_size = 64
    insensitive=true
    no-persistent-history=true
    location=center
    width=700
    height=600
    columns=3
    prompt=Search anything...
  '';
}

