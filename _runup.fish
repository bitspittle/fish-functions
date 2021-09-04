function _runup --description "Search up directories to find a command"
    set -l dir $argv[1]
    set -l command $argv[2]
    set -l full_path (echo "$dir/$command")
    set -l args $argv[3..-1]

    if test -e $full_path
        echo "Running $full_path $args..."
        $full_path $args
    else if test $dir = "/"
        echo "$command not found"
    else
        set -l parent_dir (string split -r -m1 / $dir)[1]
        _runup $parent_dir  $command $args
    end
end
