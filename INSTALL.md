# 🛠️ Installation Guide: Blue Synth Hyprland

Welcome to the Blue Synth Hyprland setup! This guide will walk you through installing the required packages and explaining exactly what they do so you are in full control of your system.

---

## Step 1: Install an AUR Helper

The official Arch repositories are great, but the Arch User Repository (AUR) contains community-maintained packages. To download them easily, you need an AUR Helper.

### Paru vs. Yay: Which should you pick?
* **Paru (Recommended):** Implemented in Rust, it is fast and feature-packed. It requires users to review the `PKGBUILD` before installing (a great security habit).
* **Yay:** Written in Go, this is a classic, battle-tested standard that is highly reliable and widely used.

**How to install `paru`:**

    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd .. && rm -rf paru

**How to install `yay`:**

    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd .. && rm -rf yay

---

## Step 2: Install the Dependencies

Now that you have an AUR helper, we will install the packages that make this desktop function.

### 🧱 Core Desktop & Display
* `hyprland` - The dynamic tiling window manager.
* `xdg-desktop-portal-hyprland` & `xdg-desktop-portal-gtk` - Essential for Wayland app communication.
* `polkit-gnome` - Provides the password pop-up for root actions.
* `sddm-git` - The display manager (login screen).
* `uwsm` - Universal Wayland Session Manager.

### 🎨 Visuals, Bar & Launchers
* `waybar` - The customizable top status bar.
* `walker` & `rofi` - Blazing-fast application launchers.
* `dunst` - The notification daemon.
* `swayosd` - Renders the on-screen display (OSD) for volume and brightness.
* `wlogout` - The graphical power/logout menu.
* `hypridle` & `hyprlock` - Idle management and screen locking.

### 🖼️ Wallpapers & Theming
* `hyprpaper`, `waypaper`, `swww`, `swaybg` - Wallpaper rendering backends.
* `nwg-look` - A GUI tool to apply GTK themes and icons.
* `matugen-bin`, `python-pywal`, `python-pywalfox`, `gradience`, `tinte`, `sunsetr` - Dynamic color and theme generation utilities.

### ⌨️ Terminal & Workflow Core
* `ghostty` - The modern terminal emulator used in this setup.
* `neovim`, `lazygit`, `yazi`, `zoxide` - Core CLI productivity tools.
* `zsh` & `starship` - The shell and the beautiful terminal prompt.
* `fzf`, `ripgrep`, `fd`, `bat`, `eza` - Modern, fast CLI tools.
* `btop`, `nvtop`, `fastfetch` - System monitoring and info.

### ⚙️ System Utilities & Audio
* `power-profiles-daemon` - Critical for hybrid laptops (Deep Sleep / 1.6W idle).
* `pamixer`, `pavucontrol`, `pulsemixer`, `wiremix` - Audio manipulation tools.
* `network-manager-applet` & `wlctl-git` - GUI and TUI Wi-Fi management.
* `blueman`, `bluez-utils`, `bluetui` - Bluetooth management tools.
* `wl-clipboard` & `cliphist` - Clipboard management.

### 📦 The Mega-Install Command

Run this command to install everything at once (replace `paru` with `yay` if preferred):

    paru -S hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome sddm-git uwsm waybar walker rofi dunst swayosd wlogout hypridle hyprlock agsv1-debug hyprpaper waypaper swww swaybg nwg-look matugen-bin python-pywal python-pywalfox gradience tinte sunsetr ttf-jetbrains-mono-nerd ttf-cascadia-mono-nerd ttf-space-mono-nerd ttf-material-symbols-variable-git ttf-readex-pro ttf-rubik-vf ttf-gabarito-git ttf-noto-sans-cjk-vf otf-font-awesome apple-fonts bemoji-git bibata-cursor-theme-bin bibata-cursor-translucent bibata-extra-cursor-theme bibata-rainbow-cursor-theme papirus-icon-theme papirus-folders yaru-icon-theme ghostty zsh starship neovim yazi zoxide fzf ripgrep fd bat eza btop nvtop fastfetch glow gum lazygit python-pynvim lua-language-server pyright cliphist wl-clipboard tealdeer brightnessctl power-profiles-daemon cpupower pamixer pavucontrol pulsemixer wiremix blueman bluez-utils bluetui network-manager-applet wlctl-git udiskie trash-cli pacman-contrib ydotool wtype grim slurp satty wf-recorder gpu-screen-recorder tesseract tesseract-data-eng thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer webp-pixbuf-loader file-roller imv mpv mpv-uosc-git zathura zathura-pdf-mupdf qalculate-gtk elephant qt5ct qt6-wayland gjs dart-sass

---

## Step 3: Setup the Shell & Link Dotfiles

Once everything is installed, you need to configure your shell and link the modular files.

1. **Install Oh My Zsh:**

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

2. **Clone this repository into your home directory:**

    git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/dotfiles

3. **Backup existing configs and link the new ones:**
   We use symbolic links (`ln -sfn`) so that changes in your `~/dotfiles` folder reflect on your system immediately.

    # Recreate modular folders
    mkdir -p ~/.config
    mkdir -p ~/.local/bin
    mkdir -p ~/.local/share/dotfiles/default/hypr/conf

    # Link standard configs
    ln -sfn ~/dotfiles/.config/hypr ~/.config/hypr
    ln -sfn ~/dotfiles/.config/waybar ~/.config/waybar
    ln -sfn ~/dotfiles/.config/nvim ~/.config/nvim
    ln -sfn ~/dotfiles/.config/ghostty ~/.config/ghostty
    ln -sfn ~/dotfiles/.config/yazi ~/.config/yazi
    ln -sfn ~/dotfiles/.config/walker ~/.config/walker

    # Link modular imports and scripts
    ln -sfn ~/dotfiles/.local/share/dotfiles ~/.local/share/dotfiles
    ln -sfn ~/dotfiles/.local/bin ~/.local/bin
    ln -sf ~/dotfiles/.zshrc ~/.zshrc

4. **Enable Essential Services:**

    sudo systemctl enable --now bluetooth.service
    sudo systemctl enable --now NetworkManager.service
    sudo systemctl enable --now power-profiles-daemon.service

5. **Final Step:**
   Log out of your current session, select **Hyprland** from your login screen, and enjoy the experience!
