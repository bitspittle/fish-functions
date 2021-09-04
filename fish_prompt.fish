function fish_prompt --description 'Multline fish prompt'
    # window width - username - ": " - "..."
    set -l max_prompt_len (math $COLUMNS - (string length $USER) - 5)

    set -l username_color (set_color -o cyan)
    set -l cwd_color (set_color -o green)
    set -l reset_color (set_color -o normal)

    set -l prompt_trimmed (prompt_pwd)
    set -l prompt_length (string length $prompt_trimmed)
    if test $prompt_length -gt $max_prompt_len
        set -l overflow (math $prompt_length - $max_prompt_len + 1)
        set prompt_trimmed (echo "..."(string sub -s $overflow $prompt_trimmed))
    end

    set -l git_prompt (echo (__fish_git_prompt))

    printf '\f\r%s%s%s: %s%s%s' $username_color $USER $reset_color $cwd_color $prompt_trimmed $reset_color

    if test $git_prompt != ""
        printf '\f\r%s' $git_prompt
    end

    printf '\f\r %s$ ' $reset_color
end
