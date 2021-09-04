function cdd --description "Allow jumping up the dir structure"
    set -l term "$argv[1]"
    set -l search_pattern (echo $term"[^/]*/")
    set -l replace_pattern1 (echo "s,.*"$term"[^/]*/,,")
    set -l replace_pattern2 "s,[^/]*,..,g"

    if test (pwd | grep -c $search_pattern) -ne 0
        cd (pwd | sed -e $replace_pattern1 -e $replace_pattern2)
    else
        set_color red
        echo "\"$term\" not found"
        set_color normal
    end
end
