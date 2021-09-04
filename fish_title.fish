function fish_title --description "Terminal title"
    set -l prefix ""
    set -l argc (count $argv)
    if test $argc -ge 1
        set -l curr_command $argv[1]
        set prefix "[$curr_command] "
    end

    echo (string join "" $prefix (prompt_pwd))
end
