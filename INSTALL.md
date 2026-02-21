# 🛠️ Manual Installation Guide

Welcome to the Blue Synth Hyprland setup! Since this is Arch Linux, we build things from the ground up. This guide will walk you through installing the required packages and explaining exactly what they do so you are in full control of your system.

---

## Step 1: Install an AUR Helper

The official Arch repositories are great, but the Arch User Repository (AUR) contains community-maintained packages (like custom themes and certain Wayland utilities). To download them easily, you need an AUR Helper.

### Paru vs. Yay: Which should you pick?
* **[Paru](https://github.com/Morganamilo/paru):** Implemented in Rust, it is a fast, feature-packed AUR helper that acts as a pacman wrapper. It is known for saner defaults, such as requiring users to review the `PKGBUILD` before installing a package (a great security habit). This is the recommended choice for this setup.
* **[Yay](https://github.com/Jguer/yay):** Written in Go, this is a classic, battle-tested standard that has been around longer and is highly reliable. 

**How to install `paru` (Recommended):**
Open your terminal and run these commands one by one to compile it from source:

    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd .. && rm -rf paru

---

## Step 2: Install the Dependencies

Now that you have `paru`, we will install all the required packages. This list has been extensively filtered to include everything that makes this specific desktop look and function perfectly—from the display manager to the terminal utilities and file managers.

### 🧱 Core Desktop & Display
* `hyprland` - The dynamic tiling window manager.
* `xdg-desktop-portal-hyprland` & `xdg-desktop-portal-gtk` - Essential for screen sharing and app communication on Wayland.
* `polkit-gnome` - Provides the pop-up box when an app asks for your root password.
* `sddm-git` - The display manager (login screen).
* `uwsm` - Universal Wayland Session Manager.

### 🎨 Visuals, Bar & Launchers
* `waybar` - The highly customizable top status bar.
* `walker` & `rofi` - Blazing-fast application launchers.
* `dunst` - The notification daemon.
* `swayosd` - Renders the on-screen display for volume and brightness.
* `wlogout` - The graphical power/logout menu.
* `hypridle` & `hyprlock` - Idle management and screen locking.
* `agsv1-debug` - Backend for custom GTK widgets.

### 🖼️ Wallpapers & Theming
* `hyprpaper`, `waypaper`, `swww`, `swaybg` - Wallpaper rendering backends and GUIs.
* `nwg-look` - A GUI tool to easily apply your GTK themes and icons.
* `matugen-bin`, `python-pywal`, `python-pywalfox`, `gradience`, `tinte`, `sunsetr` - Dynamic color generation and GTK theming utilities.

### ⌨️ Terminal & Workflow Core
* `ghostty` - A ridiculously fast, modern terminal emulator.
* `neovim` - The text editor.
* `yazi` & `zoxide` - Blazing-fast terminal file manager and smarter `cd` command.
* `zsh` & `starship` - The default shell and the customizable terminal prompt.
* `fzf`, `ripgrep`, `fd`, `bat`, `eza` - Modern, fast CLI replacements for standard Linux commands.
* `btop`, `nvtop`, `fastfetch` - System monitoring and system info fetching.
* `glow`, `gum`, `tealdeer` - Markdown rendering and CLI helpers.
* `lazygit`, `python-pynvim`, `lua-language-server`, `pyright` - Neovim integrations and language servers.

### ⚙️ System Utilities, Hardware & Audio
* `power-profiles-daemon` & `cpupower` - Critical for hybrid laptops to unlock deep sleep power states.
* `brightnessctl` - Required for your keyboard's Brightness keys.
* `pamixer`, `pavucontrol`, `pulsemixer`, `wiremix` - Audio manipulation and volume routing tools.
* `network-manager-applet` & `wlctl-git` - GUI and TUI Wi-Fi management.
* `blueman`, `bluez-utils`, `bluetui` - Bluetooth management tools.
* `wl-clipboard` & `cliphist` - Allows you to copy/paste text and images, and keeps a clipboard history.
* `udiskie` - Automounts removable media (USB drives).
* `trash-cli` - Provides a CLI recycle bin.
* `pacman-contrib`, `ydotool`, `wtype` - System automation tools.

### 📸 Screenshots & Recording
* `grim`, `slurp`, `satty` - Takes screenshots (`grim`), selects the screen area (`slurp`), and annotates them (`satty`).
* `wf-recorder` & `gpu-screen-recorder` - High-performance screen recording on Wayland.
* `tesseract` & `tesseract-data-eng` - OCR engines for extracting text from images.

### 🗂️ Desktop Applications
* `thunar`, `thunar-archive-plugin`, `thunar-volman`, `tumbler`, `ffmpegthumbnailer`, `webp-pixbuf-loader` - Graphical file manager and thumbnailers.
* `file-roller` - GUI archive manager.
* `imv` & `mpv` (with `mpv-uosc-git`) - Minimalist image and video viewers.
* `zathura` & `zathura-pdf-mupdf` - Keyboard-driven PDF reader.
* `qalculate-gtk` - Powerful desktop calculator.
* `elephant` - Productivity suite.

### 🔤 Fonts, Cursors & Frameworks
* `ttf-jetbrains-mono-nerd`, `ttf-cascadia-mono-nerd`, `ttf-space-mono-nerd`, `ttf-material-symbols-variable-git` - Essential Nerd Fonts for terminal and Waybar icons.
* `apple-fonts`, `otf-font-awesome`, `bemoji-git`, `ttf-rubik-vf`, `ttf-readex-pro`, `ttf-gabarito-git`, `ttf-noto-sans-cjk-vf` - System typography and emoji support.
* `bibata-cursor-theme-bin`, `bibata-cursor-translucent`, `bibata-extra-cursor-theme`, `bibata-rainbow-cursor-theme` - Clean, modern cursor themes.
* `papirus-icon-theme`, `papirus-folders`, `yaru-icon-theme` - Desktop icon packs.
* `qt5ct`, `qt6-wayland`, `gjs`, `dart-sass` - Frameworks to force Qt apps to respect dark themes and build SCSS widgets.

### 📦 The Mega-Install Command

Run this command to install everything at once:

    paru -S hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome sddm-git uwsm waybar walker rofi dunst swayosd wlogout hypridle hyprlock agsv1-debug hyprpaper waypaper swww swaybg nwg-look matugen-bin python-pywal python-pywalfox gradience tinte sunsetr ttf-jetbrains-mono-nerd ttf-cascadia-mono-nerd ttf-space-mono-nerd ttf-material-symbols-variable-git ttf-readex-pro ttf-rubik-vf ttf-gabarito-git ttf-noto-sans-cjk-vf otf-font-awesome apple-fonts bemoji-git bibata-cursor-theme-bin bibata-cursor-translucent bibata-extra-cursor-theme bibata-rainbow-cursor-theme papirus-icon-theme papirus-folders yaru-icon-theme ghostty zsh starship neovim yazi zoxide fzf ripgrep fd bat eza btop nvtop fastfetch glow gum lazygit python-pynvim lua-language-server pyright cliphist wl-clipboard tealdeer brightnessctl power-profiles-daemon cpupower pamixer pavucontrol pulsemixer wiremix blueman bluez-utils bluetui network-manager-applet wlctl-git udiskie trash-cli pacman-contrib ydotool wtype grim slurp satty wf-recorder gpu-screen-recorder tesseract tesseract-data-eng thunar thunar-archive-plugin thunar-volman tumbler ffmpegthumbnailer webp-pixbuf-loader file-roller imv mpv mpv-uosc-git zathura zathura-pdf-mupdf qalculate-gtk elephant qt5ct qt6-wayland gjs dart-sass

---

## Step 3: Link the Dotfiles

Once everything is installed, you need to tell your system to use these configurations.

1. Clone this repository to your computer:

    git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git ~/Downloads/blue-synth-dots

2. Backup your existing configuration files (highly recommended):

    mkdir -p ~/.config-backup
    mv ~/.config/hypr ~/.config/waybar ~/.config/nvim ~/.config-backup/ 2>/dev/null

3. Copy the contents into your `~/.config` folder:

    cp -r ~/Downloads/blue-synth-dots/* ~/.config/

4. If you need to make tweaks to the configuration files, ensure you edit them using your preferred editor:

    nvim ~/.config/hypr/hyprland.conf

5. Log out of your current session, and select **Hyprland** from your login screen.

Enjoy the Blue Synth experience!
