set fish_greeting #Escribe cualquier cosa aquí

if status is-interactive
end

zoxide init fish | source

alias zzz='zellij'

function jazz
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function fish_prompt
    if test "$ZELLIJ" = 1
        set title (basename (pwd))
        zellij action rename-tab "$title" ^/dev/null
    end

    starship prompt
end

if string match -q "*hyprland*" "$XDG_SESSION_DESKTOP"
    set -gx STARSHIP_CONFIG ~/.config/hyprship.toml
else
    starship init fish | source
end
