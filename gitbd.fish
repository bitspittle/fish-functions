function gitbd --description "Git branch deletion"
    set -l argc (count $argv)
    if test $argc -le 1
        set -l branches_to_delete (git for-each-ref --format '%(refname:short)' refs/heads/ | grep "$argv[1]")
        printf "Matching branches:\n\n"
        for branch in $branches_to_delete
            echo $branch
        end
        printf "\nDelete? [Y/n] "
        read -n 1 -p "" -l answer
        echo # Move to a new line

        if test "$answer" = "y" || test "$answer" = "Y"
            echo $branches_to_delete | xargs git branch -D 2>/dev/null
            echo -e "\nRemaining branches:"
            git branch
            echo ""
        end
    else
        echo "This command takes one arg (match pattern) or no args (match all)"
    end
end
