source ~/.local/share/dotfiles/default/zshrc/rc
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
function getplaylist() {
    echo "Downloading Playlist..."
    yt-dlp -i -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --add-metadata \
    -o "$HOME/Music/%(playlist_title)s/%(title)s.%(ext)s" "$1"
    
    echo "Scanning for new music..."
    mpc update
}

alias neovim='nvim'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
alias snvim='sudoedit'

export EDITOR='nvim'
export VISUAL='nvim'
export SUDO_EDITOR='nvim'
export MANPAGER="sh -c 'col -bx | bat -l man -p --color=always | less -R -c'"
