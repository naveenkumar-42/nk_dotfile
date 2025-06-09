# 🌿 nk_dotfile

My personal, customized dotfiles for a clean and aesthetic **Arch Linux + Hyprland** setup.

This repo includes configurations for:

- 🧊 [Hyprland](https://github.com/hyprwm/Hyprland) — dynamic tiling Wayland compositor
- 📟 [Foot](https://codeberg.org/dnkl/foot) — lightweight terminal emulator
- 📦 [Fastfetch](https://github.com/fastfetch-cli/fastfetch) — system fetch tool
- 🧾 [Waybar](https://github.com/Alexays/Waybar) — status bar
- 🔔 [Mako](https://github.com/emersion/mako) — Wayland notification daemon
- 🎶 [Cava](https://github.com/karlstav/cava) — audio visualizer
- 💻 `.bashrc` — shell customizations

---


## 📢 Check out my LinkedIn post about this setup:
👉 [View LinkedIn Post](https://www.linkedin.com/feed/update/urn:li:ugcPost:7295330947418218497/)


## 🎥 Demo Video
👉 [Click here to watch the video of my Hyprland setup](https://drive.google.com/file/d/1emn0gSKosHGCtAMJ-4J6cr7z5S59-UT1/view?usp=sharing)



## 📁 Repository Structure
```bash
nk_dotfile/
├── fastfetch/
├── mako/
├── hypr/
├── waybar/
├── foot/
├── cava/
├── nvim/
└── .bashrc
```
Each folder contains the configuration files I personally tweaked to match my workflow and visual preferences.


## 🚀 Setup Instructions
⚠️ Make sure to backup your current configs before applying these.

1. Clone the Repo
```bash
git clone https://github.com/naveenkumar-42/nk_dotfile.git
cd nk_dotfile
```

2. Copy Configs
```bash
cp -r fastfetch ~/.config/
cp -r mako ~/.config/
cp -r hypr ~/.config/
cp -r waybar ~/.config/
cp -r foot ~/.config/
cp -r cava ~/.config/
cp -r nvim ~/.config/
cp .bashrc ~/

```
You can also symlink or use tools like stow or chezmoi for easier dotfile management.

## 🛠 Recommended Packages
Ensure the following tools are installed on your system:

```bash
hyprland waybar mako cava fastfetch foot nvim
```
You may also need:
```bash
xdg-desktop-portal-hyprland playerctl swww wl-clipboard brightnessctl
```

## 🙌 Credits
Inspired by the Arch and Hyprland communities, and r/unixporn.

## 📜 License
This repo is under the MIT License. Use freely and customize!