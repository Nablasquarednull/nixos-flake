# 🐧 NixOS Workstation Configuration

This repository contains the [Nix Flakes](https://nixos.wiki/wiki/Flakes)-based configuration of my personal **NixOS Workstation**. It is tailored for productivity, development, and a clean daily driver experience.

## 🧰 Key Features

- **Flake-based setup**: Declarative, reproducible, and modular.
- **Hyprland**: A performant and minimal dynamic tiling Wayland compositor.
- **Home Manager**: Manages user environment cleanly via flakes.
- **Waybar**: Custom-styled status bar.
- **Wofi**: Themed launcher matching the system's aesthetics.
- **Hyprlock + Hypridle**: Lock screen and suspend behavior for security and power saving.
- **ZSH + Starship**: Fast shell prompt and developer-friendly terminal.
- **Kitty terminal**, **JetBrains Mono** font, and **Nerd Fonts** integration.
- **Custom modules**: Configs are organized in a modular fashion for maintainability.

## 🛠️ Usage

> ⚠️ You should have basic understanding of NixOS, flakes, and Git before using this.

### Clone the repo:

```bash
git clone https://github.com/NablaSquaredNull/nixos-flake.git
cd nixos-flake
