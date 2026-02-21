# 🛠️ Installation Guide: Blue Synth Hyprland

Welcome to the Blue Synth setup. This guide assumes you are starting from a fresh Arch Linux installation. We will take you from a bare terminal to a fully optimized, keyboard-driven desktop.

---

## Step 1: Base Essentials
Before you can download this repository, you need the tools to handle the installation.

    sudo pacman -S --needed base-devel git

---

## Step 2: Install an AUR Helper
The "Blue Synth" environment relies on several packages found in the Arch User Repository (AUR). Choose one:

**Option A: Paru (Recommended)**

    git clone https://aur.archlinux.org/paru.git
    cd paru && makepkg -si && cd .. && rm -rf paru

**Option B: Yay (Alternative)**

    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si && cd .. && rm -rf yay

---

## Step 3: Install the Dependencies

Run this mega-command to install the window manager, status bar, shell, and optimization tools.

    paru -S hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome sddm-git uwsm waybar walker rofi dunst swayosd wlogout hypridle hyprlock agsv1-debug hyprpaper waypaper swww swaybg nwg-look matugen-bin python-pywal python-pywalfox gradience tinte sunsetr ttf-jetbrains-mono-nerd ttf-cascadia-mono-nerd ttf-space-mono-nerd ttf-material-symbols-variable-git ttf-readex-pro ttf-rubik-vf ttf-gabarito-git ttf-noto-sans-cjk-vf otf-font-awesome apple-fonts bemoji-git bibata-cursor-theme-bin bibata-cursor-translucent bibata-extra-cursor-theme bibata-rainbow-cursor-theme papirus-icon-theme papirus-folders yaru-icon-theme ghostty zsh starship neovim yazi zoxide fzf ripgrep fd bat eza btop nvtop fastfetch glow gum lazygit python-pynvim lua-language-server pyright cliphist wl-clipboard tealdeer brightnessctl power-profiles-daemon cpupower pamixer pavucontrol pulsemixer wiremix blueman bluez-utils bluetui network-manager-applet wlctl-git udiskie trash-cli pacman-contrib ydotool wtype grim slurp satty wf-recorder gpu-screen-recorder tesseract tesseract-data-eng thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer webp-pixbuf-loader file-roller imv mpv mpv-uosc-git zathura zathura-pdf-mupdf qalculate-gtk elephant qt5ct qt6-wayland gjs dart-sass

---

## Step 4: Setup Shell & Architecture

This setup expects a specific folder structure to resolve modular imports (like keybinds and autostarts).

1. **Install Oh My Zsh (Unattended):**

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

2. **Clone this repository into the required path:**
   *Note: Modular Hyprland files are hard-coded to look in ~/.local/share/dotfiles. Do not change this path.*

    mkdir -p ~/.local/share
    git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/.local/share/dotfiles

3. **Link the Dotfiles:**
   We use symbolic links (`ln -sfn`) so that changes in the repo reflect on your system immediately.

    # 1. Create system destination folders
    mkdir -p ~/.config
    mkdir -p ~/.local/bin

    # 2. Link core config folders
    ln -sfn ~/.local/share/dotfiles/.config/hypr ~/.config/hypr
    ln -sfn ~/.local/share/dotfiles/.config/waybar ~/.config/waybar
    ln -sfn ~/.local/share/dotfiles/.config/nvim ~/.config/nvim
    ln -sfn ~/.local/share/dotfiles/.config/ghostty ~/.config/ghostty
    ln -sfn ~/.local/share/dotfiles/.config/yazi ~/.config/yazi
    ln -sfn ~/.local/share/dotfiles/.config/walker ~/.config/walker

    # 3. Link modular paths and shell files
    ln -sfn ~/.local/share/dotfiles/.local/bin ~/.local/bin
    ln -sf ~/.local/share/dotfiles/.zshrc ~/.zshrc

---

## Step 5: Enable Essential Services

Run these to ensure your hardware and login screen work correctly.

    sudo systemctl enable --now bluetooth.service
    sudo systemctl enable --now NetworkManager.service
    sudo systemctl enable --now power-profiles-daemon.service
    sudo systemctl enable --now sddm.service

---

## 🏁 Final Step

**Reboot your system.** When the login screen appears, ensure "Hyprland" is selected in the session menu. 

Enjoy the Blue Synth experience. 🌌
