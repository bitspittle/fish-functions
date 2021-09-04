function mp4togif --description "Convert mp4 to gif"
    set -l input ""
    set -l output ""
    set -l argc (count $argv)

    if test $argc -eq 1
        set input $argv[1]
        set -l filebase (string sub -e -4 $input)
        set output (string join "" $filebase ".gif")
    else if test $argc -eq 2
        set input $argv[1]
        set output $argv[2]
    else
        echo "Usage: mp4togif input.mp4 [output.gif]"
        return 1
    end

    ffmpeg \
      -i $input \
      -vf "fps=10" \
      -c:v pam \
      -f image2pipe - | convert -delay 10 - -layers optimize $output
end
