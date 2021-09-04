function g6 --description "Run gradlew, searching dirs until found"
    _runup (pwd) gradlew $argv[1..-1]
end
