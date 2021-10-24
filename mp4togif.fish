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
      -vf "palettegen=stats_mode=diff" \
      -y palette.png

    ffmpeg \
      -i $input \
      -i palette.png \
      -lavfi "fps=10,paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" \
      -y $output

    rm palette.png
end
