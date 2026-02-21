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
```bash
sudo pacman -S --needed base-devel git
git clone [https://aur.archlinux.org/paru.git](https://aur.archlinux.org/paru.git)
cd paru
makepkg -si
cd .. && rm -rf paru
```

---

## Step 2: Install the Dependencies

Now that you have `paru`, you can install all the necessary packages. Here is exactly what you are installing and why:

### 🧱 Core Desktop & Display
The foundation of the Wayland environment.
* `hyprland` - The dynamic tiling window manager itself.
* `xdg-desktop-portal-hyprland` - Essential for screen sharing and app communication on Wayland.
* `xdg-desktop-portal-gtk` - A fallback portal so standard GTK applications behave correctly.
* `polkit-gnome` - Provides the pop-up box when an app asks for your sudo/root password.

### 🎨 Visuals & UI
The components that create the "Blue Synth" aesthetic.
* `waybar` - The highly customizable top status bar.
* `walker` - The blazing-fast application launcher.
* `dunst` - The notification daemon for those clean, bordered pop-ups.
* `hyprpaper` - Handles setting the desktop background.
* `wlogout` - The graphical power/logout menu.
* `nwg-look` - A GUI tool to easily apply your GTK themes and icons.

### ⌨️ Terminal & Workflow
The core applications for a keyboard-driven workflow.
* `ghostty` - A ridiculously fast, modern terminal emulator.
* `neovim` - The text editor (We recommend setting it up with the LazyVim distribution).
* `yazi` - A blazing-fast terminal file manager.
* `zsh` & `starship` - The default shell and the customizable, beautiful terminal prompt.
* `btop` & `fastfetch` - Good-looking system monitoring and system info fetching.

### ⚙️ System Utilities (The "Invisible" Essentials)
Without these, your media keys, screenshots, and battery optimizations will fail.
* `grim` & `slurp` - Takes screenshots (`grim`) and lets you select the screen area (`slurp`).
* `wl-clipboard` & `cliphist` - Allows you to copy/paste text and images, and keeps a clipboard history.
* `pamixer` & `brightnessctl` - Required for your keyboard's Volume and Brightness keys to work.
* `power-profiles-daemon` - **Critical for hybrid laptops.** Allows the GPU to enter Deep Sleep, unlocking an incredible ~1.6W idle power draw.
* `network-manager-applet` - Provides the Wi-Fi icon in Waybar.
* `blueman` & `bluez-utils` - Handles Bluetooth pairing and device management.

### 🔤 Fonts & Theming Rules
* `ttf-jetbrains-mono-nerd` - Essential. Without this, the icons in your terminal and Waybar will look like broken squares.
* `qt5ct` & `qt6-wayland` - Required to force Qt apps to respect your dark themes and run natively on Wayland.

### 📦 The One-Command Install

Run this command to install everything at once:

```bash
paru -S hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk polkit-gnome \
waybar walker dunst hyprpaper wlogout nwg-look \
ghostty neovim yazi zsh starship btop fastfetch \
grim slurp wl-clipboard cliphist pamixer brightnessctl power-profiles-daemon \
network-manager-applet blueman bluez-utils ttf-jetbrains-mono-nerd qt5ct qt6-wayland
```

---

## Step 3: Link the Dotfiles

Once everything is installed, you need to tell your system to use these configurations.

1. Clone this repository to your computer:
```bash
git clone [https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git](https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git) ~/Downloads/blue-synth-dots
```

2. Backup your existing configuration files (highly recommended):
```bash
mkdir -p ~/.config-backup
mv ~/.config/hypr ~/.config/waybar ~/.config/nvim ~/.config-backup/ 2>/dev/null
```

3. Copy the contents into your `~/.config` folder:
```bash
cp -r ~/Downloads/blue-synth-dots/* ~/.config/
```

4. If you need to make tweaks to the configuration files, ensure you edit them via Neovim:
```bash
nvim ~/.config/hypr/hyprland.conf
```

5. Log out of your current session, and select **Hyprland** from your login screen.

Enjoy the Blue Synth experience!
