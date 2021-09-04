function ff --description "Find file"
    set -l searchdir "."
    set -l filename "*"
    set -l argc (count $argv)

    if test $argc -eq 1
        set filename $argv[1]
    else if test $argc -eq 2
        set searchdir $argv[1]
        set filename $argv[2]
    else
        echo "Usage: ff [dir] filename"
        return 1
    end

    find $searchdir -name $filename
end
