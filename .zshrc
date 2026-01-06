source ~/.local/share/dotfiles/default/zshrc/rc
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

alias neovim='nvim'
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'
