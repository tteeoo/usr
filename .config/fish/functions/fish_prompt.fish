function fish_prompt
    if test -n "$SSH_TTY"
        echo -n (set_color brred)"$USER"(set_color white)'@'(set_color yellow)(prompt_hostname)' '
    end

    echo -n (set_color 83A598)(pwd)' '

    echo -n (git_status_prompt)

    set_color -o
    if test "$USER" = 'root'
        echo -n (set_color CC241D)'# '
    end
    echo -n (set_color 8EC07C)'$ '
    set_color normal
end
