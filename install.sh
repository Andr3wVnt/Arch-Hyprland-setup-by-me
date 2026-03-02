#!/bin/bash

# --- 🌌 Blue Synth Hyprland: Automated Installer ---
set -e # Stop on any error

echo "🌌 Starting the Blue Synth installation..."

# 1. Environment Check & Git installation
echo "🔍 Checking for base essentials..."
sudo pacman -S --needed --noconfirm base-devel git

# 2. AUR Helper Check
if ! command -v paru &>/dev/null && ! command -v yay &>/dev/null; then
    echo "📦 Installing paru (AUR helper)..."
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru && makepkg -si --noconfirm && cd -
fi
AUR_HELPER=$(command -v paru || command -v yay)

# 3. Mega-Install
echo "📥 Downloading the environment..."
$AUR_HELPER -S --needed --noconfirm hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome sddm-git uwsm waybar walker rofi dunst swayosd wlogout hypridle hyprlock agsv1-debug hyprpaper waypaper swww swaybg nwg-look matugen-bin python-pywal python-pywalfox gradience tinte sunsetr ttf-jetbrains-mono-nerd ttf-cascadia-mono-nerd ttf-space-mono-nerd ttf-material-symbols-variable-git ttf-readex-pro ttf-rubik-vf ttf-gabarito-git ttf-noto-sans-cjk-vf otf-font-awesome apple-fonts bemoji-git bibata-cursor-theme-bin bibata-cursor-translucent bibata-extra-cursor-theme bibata-rainbow-cursor-theme papirus-icon-theme papirus-folders yaru-icon-theme ghostty zsh starship neovim yazi zoxide fzf ripgrep fd bat eza btop nvtop fastfetch glow gum lazygit python-pynvim lua-language-server pyright cliphist wl-clipboard tealdeer brightnessctl power-profiles-daemon cpupower pamixer pavucontrol pulsemixer wiremix blueman bluez-utils bluetui network-manager-applet wlctl-git udiskie trash-cli pacman-contrib ydotool wtype grim slurp satty wf-recorder gpu-screen-recorder tesseract tesseract-data-eng thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer webp-pixbuf-loader file-roller imv mpv mpv-uosc-git zathura zathura-pdf-mupdf qalculate-gtk elephant qt5ct qt6-wayland gjs dart-sass

# 4. Shell Setup
echo "🐚 Setting up ZSH..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 5. The Architecture Link (The core fix)
echo "🔗 Linking dotfiles into architecture..."
REPO_DIR=$(pwd)
mkdir -p ~/.config ~/.local/bin ~/.local/share

# Link entire .config subdirectories
for dir in "$REPO_DIR"/.config/*/; do
    ln -sfn "$dir" "$HOME/.config/$(basename "$dir")"
done

# Link the modular share files and shell
ln -sfn "$REPO_DIR/.local/share/dotfiles" "$HOME/.local/share/dotfiles"
ln -sfn "$REPO_DIR/.local/bin" "$HOME/.local/bin"
ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"

# --- 🛡️ System-Level Configs (Requires Root) ---
echo "🛡️ Applying system-wide configurations (Pacman, SDDM, Modprobe)..."

if [ -d "$HOME/dotfiles/etc" ]; then
    echo "You will be prompted for your sudo password to copy /etc files."
    sudo cp -rv "$HOME/dotfiles/etc/"* /etc/
    echo "✅ System configs applied successfully."
else
    echo "⏩ No /etc directory found in dotfiles. Skipping system configs."
fi

# 6. Enable Services
echo "⚙️  Starting system services..."
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now power-profiles-daemon.service
sudo systemctl enable --now sddm.service

echo "✨ Done! Reboot and log into Hyprland."
