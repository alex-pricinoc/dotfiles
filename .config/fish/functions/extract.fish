function extract
    for file in $argv
        switch $file
            case '*.zip'
                unzip $file
            case '*.7z'
                7z x $file
            case '*.tar.gpg'
                gpg -d $file | tar -x
            case '*.rar'
                unrar e $file
            case '*'
                tar -xf $file
        end
    end
end
