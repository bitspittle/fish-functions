function listen --description "Listen to a process ID"
    set -l pid "0"
    set -l channel "1"
    set -l argc (count $argv)

    if test $argc -eq 1
        set pid $argv[1]
    else if test $argc -eq 2
        set pid $argv[1]
        set channel $argv[2]
    else
        echo "Usage: listen pid [channel]"
        return 1
    end

    sudo cat /proc/$pid/fd/$channel
end
