{config, pkgs, ... }:
{
	home.username = "drew";
	home.homeDirectory = "/home/drew";

	programs.home-manager.enable = true;

	programs.zsh = {
	enable = true;
	oh-my-zsh.enable = true;
	oh-my-zsh.theme = "agnoster";
	};

	programs.kitty.enable = true;

	wayland.windowManager.hyprland = {
	enable = true;
	settings = {
		"$mod" = "SUPER";
		bind = [
		"$mod, Return, exec, kitty"
		"SUPERSHIFT, Q, killactive,"
		"$mod, D, exec, wofi --show drun"
		"$mod SHIFT, H, movewindow, l"
		"$mod SHIFT, L, movewindow, r"
		"$mod SHIFT, K, movewindow, u"
		"$mod SHIFT, J, movewindow, d"
		"$mod, H, movefocus, l"
		"$mod, L, movefocus, r"
		"$mod, K, movefocus, u"
		"$mod, J, movefocus, d"

			] ++ (
			  builtins.concatLists (builtins.genList (i:
			    let
			      ws = toString (i + 1);
			    in [
			      "$mod, ${ws}, workspace, ${ws}"
			      "$mod SHIFT, ${ws}, movetoworkspace, ${ws}"
			    ]
			  ) 9)
			);


			};
		};
	wayland.windowManager.hyprland.extraConfig =''
	input {
	kb_layout=es
	}
	'';

	home.packages = with pkgs; [
	waybar
	wofi
	kitty
	firefox
	zsh
	neovim
	fastfetch
	btop
	zathura
	yt-dlp
	git-credential-oauth
	anki-bin
	pamixer
	brightnessctl
	fzf
	eza
	inetutils
	playerctl
	grim
	slurp
	wl-clipboard
	xdg-utils
	nix-output-monitor
	nixfmt-rfc-style
	];
	home.stateVersion = "25.05";
}

