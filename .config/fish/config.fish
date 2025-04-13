function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set fish_greeting ""

# alias
alias ls eza
alias la "eza -a"
alias ll "eza -l --icons=always"
alias lla "eza -a -l --icons=always"
alias sc "scrcpy --video-codec=h265 --max-fps=60 --audio-codec=raw"

# oh my posh
oh-my-posh init fish | source

# zoxide
zoxide init fish | source

switch (uname)
  case Darwin
    /opt/homebrew/bin/brew shellenv | source
end
