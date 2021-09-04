function fif --description "Find in file"
    set -l searchdir "."
    set -l filename "*"
    set -l pattern ""
    set -l argc (count $argv)

    if test $argc -eq 1
        set pattern $argv[1]
    else if test $argc -eq 2
        set filename $argv[1]
        set pattern $argv[2]
    else if test $argc -eq 3
        set searchdir $argv[1]
        set filename $argv[2]
        set pattern $argv[3]
    else
        echo "Usage: fif [[dir] file-pattern] match-pattern"
        return 1
    end

    find $searchdir -type f -name $filename 2>/dev/null | xargs -E '\n' grep --color -e $pattern 2>/dev/null

end
