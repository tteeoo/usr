function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color 689D6A)(pwd)' '

    set_color -o
    if test "$USER" = 'root'
        echo -n (set_color CC241D)'# '
    end
    echo -n (set_color B16286)'$ '
    set_color normal
end
