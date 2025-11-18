{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster"; # Puedes cambiarlo a "robbyrussell", "agnoster", etc.
      plugins = [
        "git"
        "sudo"
        "z"
      ];
    };

    # Prompt más limpio y usable
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

  };
}

