function mdview
  pandoc $argv | lynx -stdin
end

